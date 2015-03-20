require 'capybara/rspec'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    6.times { airport.landing_permission Plane.new }
    expect(airport.landed_planes.length).to eq 6
    airport.landed_planes.each do |plane|
      expect(plane.status).to eq 'landed'
    end
    airport.landed_planes.each do |plane|
      airport.request_plane_to_takeoff plane
    end

  end

end
