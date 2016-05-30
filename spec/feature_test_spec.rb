require 'capybara/rspec'
require 'airport'

feature 'FEATURE TEST: Airport' do
  scenario 'Landing a plane' do
    new_airport
    new_plane
    new_airport.land_plane(new_plane)
  end

  scenario 'Taking off a plane' do
    new_landed_plane
    # new_airport.take_off_plane(new_landed_plane)
  end
end

def new_airport
  Airport.new
end

def new_plane
  Plane.new
end

def new_landed_plane
  new_airport
  new_plane
  new_airport.land_plane(new_plane)
end
