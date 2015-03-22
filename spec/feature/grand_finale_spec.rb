require 'capybara/rspec'
require 'weather.rb'
require 'airport.rb'
require 'plane.rb'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  xscenario 'all planes can land and all planes can take off'
end

feature 'As a pilot' do
  plane = Plane.new
  airport = Airport.new
  scenario 'I would like to land my plane at the appropriate airport' do
    weather = double('Weather', weather: 'sunny')
    airport.weather weather
    airport.land_plane plane
    expect(plane.flying).to be false
  end
  scenario 'I would like to take off from appropriate airport' do
    weather = double('Weather', weather: 'sunny')
    airport.weather weather
    airport.takeoff_plane
    expect(plane.flying).to be true
  end
end

feature 'As an airtraffic controller' do
  airport = Airport.new
  scenario 'I want to prevent planes landing if airport is full' do
    weather = double('Weather', weather: 'sunny')
    airport.weather weather
    planes = []
    20.times do
      plane = Plane.new
      planes << plane
      p planes
    end
    planes.each { |plane| airport.land_plane plane }
    plane = Plane.new
    expect { airport.land_plane plane }.to raise_error 'cannot land'
  end
end
