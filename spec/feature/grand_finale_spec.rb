require 'spec_helper'
require 'capybara/rspec'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario '6 planes can land' do
    airport = Airport.new
    allow(airport).to receive(:random_weather).and_return('calm')
    6.times { airport.land Plane.new }
    airport.planes.each { |p| expect(p).to be_landed }
  end

  scenario '6 planes can land & then 3 take off' do
    airport = Airport.new
    allow(airport).to receive(:random_weather).and_return('calm')
    6.times { airport.land Plane.new }
    3. times { airport.takeoff }
    expect(airport.planes.count).to eq 3
  end

  scenario 'Plane cannot land at full airport' do
    airport = Airport.new
    allow(airport).to receive(:random_weather).and_return('calm')
    6.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'Airport Full'
  end

  scenario 'Plane cannot land with stormy weather' do
    airport = Airport.new
    allow(airport).to receive(:random_weather).and_return('stormy')
    expect { airport.land Plane.new }.to raise_error 'Stormy weather'
  end

end