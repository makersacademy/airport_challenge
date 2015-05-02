require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'air_traffic_incoming' do

# As an air traffic controller
# So that I can avoid collisions
# I want to be able to prevent airplanes landing when the airport if full

  scenario 'prevent planes landing when airport is full' do
    airport = Airport.new
    airport.capacity.times {airport.receive Plane.new}
    expect { airport.receive Plane.new }.to raise_error 'airport cannot receive planes when at capacity'
  end

end