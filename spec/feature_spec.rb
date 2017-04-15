require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'getting passengers to a destination' do
    given_there_is_an_airport
    and_there_is_a_plane
    when_i_instruct_a_plane_to_land_at_an_airport
    then_the_plane_should_land_at_the_airport
    and_the_plane_should_confirm_that_it_has_landed
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

  def and_the_plane_should_confirm_that_it_has_landed
    expect(@plane).to receive(:has_landed)
    @plane.has_landed
    expect(@plane).to have_landed
  end

end
