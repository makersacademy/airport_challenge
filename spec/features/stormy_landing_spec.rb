require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'landing in stormy weather' do
    given_there_is_an_airport
    and_there_is_a_plane
    when_the_weather_at_the_airport_is_stormy
    then_planes_should_be_unable_to_land
  end

  def given_there_is_an_airport
    weather = double(:weather, :conditions => :stormy)
    allow(weather).to receive(:is_a?).with(Climate).and_return(true)
    @airport = Airport.new(weather)
  end

  def and_there_is_a_plane
    @plane = Plane.new
  end

  def when_the_weather_at_the_airport_is_stormy
    expect(@airport.conditions).to eq :stormy
  end

  def then_planes_should_be_unable_to_land
    expect { @airport.dock_plane(@plane) }.to raise_error "Error: Landing forbidden when weather is stormy."
  end

end
