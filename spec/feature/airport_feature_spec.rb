require 'capybara/rspec'

feature 'plane comes in to land' do
  scenario 'the plane tries to land, but the airport is full' do
    plane = Plane.new
    airport = Airport.new
    expect { airport.land_plane(plane) }.to raise_error 'Airport Full'
  end
end
