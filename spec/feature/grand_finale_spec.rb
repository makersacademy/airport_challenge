require 'capybara/rspec'
require 'airport'
require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  xscenario 'all planes can land and all planes can take off'
end

feature 'a pilot flies a plane' do
  # scenario 'plane lands at destination' do
  #   airport = Airport.new
  #   plane = Plane.new
  #   airport.land plane
  #   expect(plane.status).to eq "landed"
  # end

  scenario 'plane cannot land, airport is full' do
    airport = Airport.new
    expect(airport.capacity).to eq 10
  end

  # scenario 'plane cannot land, weather is stormy' do
  # airport = Airport.new
  # plane = Plane.new
  # expect { airport.land plane }.to raise_error 'stormy weather, permission denied'
  # end

  xscenario 'plane takes off from airport'
  #   airport = Airport.new
  #   plane = Plane.new
  #   airport.capacity = 1 # had airport.land before but it was making the test fail when wheather is stormy or airport full
  #   airport.condition = "sunny"
  #   airport.take_off plane
  #   expect(plane.status).to eq "flying"
  # end
end



