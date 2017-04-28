require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'releasing planes' do
    given_there_is_an_airport
    and_there_is_a_plane_at_the_airport
    when_i_instruct_a_plane_to_take_off_from_an_airport
    then_the_plane_should_take_off_from_the_aiport
    and_the_plane_should_confirm_it_has_left_the_airport
  end

  def given_there_is_an_airport
    climate = double(:climate, :conditions => :sunny)
    allow(climate).to receive(:is_a?).with(Climate).and_return(true)
    @airport = Airport.new(climate)
  end

  def and_there_is_a_plane_at_the_airport
    @plane = Plane.new
    @spy_plane = spy(:plane) # Used to check the instructions planes are sent while docking and releasing.
    @airport.dock_plane(@plane)
    @airport.dock_plane(@spy_plane)
  end

  def when_i_instruct_a_plane_to_take_off_from_an_airport
    @airport.release_plane(@plane)
    @airport.release_plane(@spy_plane)
  end

  def then_the_plane_should_take_off_from_the_aiport
    expect(@plane.landed).to eq false
    expect(@airport.planes).to_not include @plane
  end

  def and_the_plane_should_confirm_it_has_left_the_airport
    expect(@spy_plane).to have_received(:confirm_take_off)
  end
end
