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

  # planes.each { |plane| airport.landing_permission plane }

  scenario '6 planes can land' do
    # airport = Airport.new
    # puts "planes length = #{planes.length}"
    # puts airport.weather_good
    # puts airport.can_land
    # puts "landed planes = #{airport.landed_planes.length}"
    planes.each { |plane| airport.landing_permission plane }
    expect(airport.landed_planes.length).to eq 6
  end

  scenario 'plane is denied landing permission when airport is full' do
    # puts "planes length"
    # puts planes.length
    # puts "plane_7"
    # puts plane_7
    planes.each { |plane| airport.landing_permission plane }
    # puts airport.landing_permission plane_7
    expect(airport.landing_permission plane_7).to eq 'permission denied'
    # puts airport.landed_planes.length
  end

  scenario '6 landed planes have status: landed' do
    airport.landed_planes.each do |plane|
      expect(plane.status).to eq 'landed'
    end
  end

  scenario 'after all 6 planes takeoff there are no more landed planes' do
    planes.each do |plane|
      airport.request_plane_to_takeoff plane
    end
    expect(airport.landed_planes.length).to eq 0
  end

  scenario 'after all 6 planes takeoff their status is \'flying\'' do
    planes.each do |plane|
      airport.request_plane_to_takeoff plane
      expect(plane.status).to eq 'flying'
    end
    # expect(airport.landed_planes.length).to eq 0
  end

  # scenario 'all planes can land and all planes can take off' do
  #   airport = Airport.new
  #   planes = []
  #   6.times { planes << Plane.new  }
  #   planes.each { |plane| airport.landing_permission plane }
  #   expect(airport.landed_planes.length).to eq 6
  #   airport.landed_planes.each do |plane|
  #     expect(plane.status).to eq 'landed'
  #   end
  #   planes.each_with_index do |plane|
  #     airport.request_plane_to_takeoff plane
  #   end
  #   expect(airport.airborne_planes.length).to eq 6
  #   expect(airport.landed_planes.length).to eq 0
  # end

end
