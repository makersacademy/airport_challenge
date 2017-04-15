require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'getting passengers to a destination' do
    given_there_is_an_airport
    and_there_is_a_plane
    when_i_instruct_a_plane_to_land_at_an_airport
    then_the_plane_should_land_at_the_airport
    and_the_airport_should_confirm_with_the_plane_that_it_has_landed
  end
  def given_there_is_an_airport
    @airport = Airport.new
  end

  def and_there_is_a_plane
    @plane = Plane.new
  end

  def when_i_instruct_a_plane_to_land_at_an_airport
    @airport.dock_plane(@plane)
  end

  def then_the_plane_should_land_at_the_airport
    expect(@airport.planes).to include @plane
  end

  def and_the_airport_should_confirm_with_the_plane_that_it_has_landed
    spy_plane = spy(:plane)
    @airport.dock_plane(spy_plane)
    expect(spy_plane).to have_received(:has_landed?)
    expect(@plane.has_landed?).to eq true
  end

end
