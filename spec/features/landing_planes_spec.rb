require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'landing planes' do
    given_there_is_an_airport
    and_there_is_a_plane
    when_i_instruct_a_plane_to_land_at_an_airport
    then_the_plane_should_land_at_the_airport
    and_the_plane_should_confirm_that_it_has_landed
  end

  def given_there_is_an_airport
    climate = double(:climate, :conditions => :sunny)
    allow(climate).to receive(:is_a?).with(Climate).and_return(true)
    @airport = Airport.new(climate)
  end

  def and_there_is_a_plane
    @plane = Plane.new
    @spy_plane = spy(:plane) # Used to check the instructions planes are sent while docking and releasing.
  end

  def when_i_instruct_a_plane_to_land_at_an_airport
    @airport.dock_plane(@plane)
    @airport.dock_plane(@spy_plane)
  end

  def then_the_plane_should_land_at_the_airport
    expect(@plane.landed).to eq true
    expect(@airport.planes).to include @plane
  end

  def and_the_plane_should_confirm_that_it_has_landed
    expect(@spy_plane).to have_received(:confirm_landing)
  end

end
