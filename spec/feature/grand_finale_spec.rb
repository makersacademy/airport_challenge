require 'capybara/rspec'
require 'airport'

feature 'Grand Finale' do

  airport = Airport.new
  planes = []
  6.times { planes << Plane.new }
  p = Plane.new

  scenario '6 planes can be created' do
    expect(planes.length).to eq 6
  end

  scenario '6 planes can land' do
    planes.each { |plane| airport.landing_permission plane }
    expect(airport.landed_planes.length).to eq 6
  end

  scenario 'plane is denied landing permission when airport is full' do
    expect { (airport.landing_permission p).to raise_error 'permission denied' }
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
      expect(plane.status).to eq 'flying'
    end
  end
end
