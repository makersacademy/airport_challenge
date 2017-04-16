require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'releasing planes' do
    given_there_is_an_airport
    and_there_is_a_plane_docked_at_the_airport
    when_the_weather_at_the_airport_is_stormy
    then_planes_should_be_unable_to_take_off
  end

  def given_there_is_an_airport
    @airport = Airport.new
  end

  def and_there_is_a_plane_docked_at_the_airport
    @plane = Plane.new
    @airport.dock_plane(@plane)
  end

  def when_the_weather_at_the_airport_is_stormy
    expect(@airport.weather).to eq :stormy
  end

  def then_planes_should_be_unable_to_take_off
    expect{ @airport.release_plane(@plane) }.to raise_error "Error: Take-off forbidden when weather is stormy."
  end

end
    
