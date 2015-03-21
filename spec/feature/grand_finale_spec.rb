require 'capybara/rspec'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  airport = Airport.new
  planes = []
  6.times { planes << Plane.new }
  plane_7 = Plane.new

  scenario '6 planes can be created' do
    expect(planes.length).to eq 6
  end

  scenario '6 planes can land' do
    planes.each { |plane| airport.landing_permission plane }
    expect(airport.landed_planes.length).to eq 6
  end

  scenario 'plane is denied landing permission when airport is full' do
    planes.each { |plane| airport.landing_permission plane }
    expect(airport.landing_permission plane_7).to eq 'permission denied'
  end

  scenario '6 landed planes have status: landed' do
    airport.landed_planes.each do |plane|
      expect(plane.status).to eq 'landed'
    end
  end

  scenario 'after all 6 planes takeoff there are no more landed planes' do
    planes.each do |plane|
      airport.order_plane_to_takeoff plane
    end
    expect(airport.landed_planes.length).to eq 0
  end

  scenario 'after all 6 planes takeoff their status is \'flying\'' do
    planes.each do |plane|
      airport.order_plane_to_takeoff plane
      expect(plane.status).to eq 'flying'
    end
  end
end
