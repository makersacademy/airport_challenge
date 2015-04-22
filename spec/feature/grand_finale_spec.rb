require 'capybara/rspec'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  scenario 'planes can land and take off' do
    allow(airport).to receive(:weather) { 'sunny' }
    expect(plane.status).to eq 'airborne'
    airport.land plane
    airborne_plane = airport.take_off
    expect(airborne_plane.status).to eq 'airborne'
  end

  scenario 'airport has a limited capacity' do
    allow(airport).to receive(:weather) { 'sunny' }
    expect { airport.take_off }.to raise_error 'Airport is Empty'
    airport.capacity.times { airport.land plane }
    expect { airport.land plane }.to raise_error 'Sorry, Airport Full'
  end

  scenario 'the planes cannot fly during stormy weather' do
    allow(airport).to receive(:weather) { 'sunny' }
    airport.land plane
    allow(airport).to receive(:weather) { 'stormy' }
    expect { airport.land plane }.to raise_error 'Impossible, Stormy Weather'
    expect { airport.take_off }.to raise_error 'Impossible, Stormy Weather'
  end
end
