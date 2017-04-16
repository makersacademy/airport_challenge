require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'take-off in stormy weather' do
    given_there_is_an_airport
    and_there_is_a_plane_docked_at_the_airport
    when_the_weather_at_the_airport_is_stormy
    then_the_plane_should_be_unable_to_take_off
  end

  def given_there_is_an_airport
    weather = double(:weather, :conditions => :stormy)
    allow(weather).to receive(:is_a?).with(Climate).and_return(true)
    @airport = Airport.new(weather)
  end

  def and_there_is_a_plane_docked_at_the_airport
    @plane = Plane.new
    @airport.dock_plane(@plane)
  end

  def when_the_weather_at_the_airport_is_stormy
    expect(@airport.conditions).to eq :stormy
  end
  
  def then_the_plane_should_be_unable_to_take_off
    expect{ @airport.release_plane(@plane) }.to raise_error "Error: Take-off forbidden when weather is stormy."
  end 

end
