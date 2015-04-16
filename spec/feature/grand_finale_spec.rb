require 'capybara/rspec'
require 'weather.rb'
require 'airport.rb'
require 'plane.rb'

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
    end
    planes.each { |plane| airport.land_plane plane }
    plane = Plane.new
    expect { airport.land_plane plane }.to raise_error 'cannot land'
  end
  scenario 'I want to prevent planes landing if it is stormy' do
    weather = double('Weather', weather: 'stormy')
    airport.weather weather
    plane = Plane.new
    expect { airport.land_plane plane }.to raise_error 'cannot land'
  end
end

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  airport = Airport.new
  weather = Weather.new
  airport.weather weather
  planes = []
  6.times do
    plane = Plane.new
    planes << plane
  end
  scenario 'all planes can land and all planes can take off' do
    puts "the weather is #{weather.weather}"
    if !airport.weather weather
      expect { planes.each { |plane| airport.land_plane plane } }
        .to raise_error 'cannot land'
    else
      planes.each { |plane| airport.land_plane plane }
      planes.each { |plane| expect(plane.flying).to eq false }
    end
    if !airport.weather weather
      expect { 6.times { airport.takeoff_plane } }
        .to raise_error 'cannot takeoff'
    else
      6.times { airport.takeoff_plane }
      planes.each { |plane| expect(plane.flying).to eq true }
    end

  end
end
