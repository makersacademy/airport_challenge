require 'capybara/rspec'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'planes can land and take off' do
    airport = Airport.new
    plane = Plane.new
    expect(plane.status).to eq 'airborne'
    airport.land plane
    airborne_plane = airport.take_off
    expect(airborne_plane.status).to eq 'airborne'
  end

  scenario 'airport has a limited capacity' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off }.to raise_error 'Airport is Empty'
    airport.capacity.times { airport.land plane }
    expect { airport.land plane }.to raise_error 'Sorry, Airport Full'
  end

  # scenario
end
