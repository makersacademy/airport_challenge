require 'capybara/rspec'
require 'airport'
require 'plane'

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'all planes can take off' do
    plane = Plane.new
    airport = Airport.new
    airport.receive plane
    airport.launch plane
    planes = airport.planes
    expect(planes.include? plane).to be false
  end

  scenario 'all planes can land' do
    plane = Plane.new
    airport = Airport.new
    airport.receive plane
    planes = airport.planes
    expect(planes.include? plane).to be true
  end

end
