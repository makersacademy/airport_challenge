## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land
require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'airport can land and take off planes' do
  scenario 'airplane can land and take off' do
    airport = Airport.new
    plane = Plane.new
    airport.land plane
    airport.take_off
  end
  scenario 'plane cannot land if airport is full (6 planes)' do
    airport = Airport.new
    6.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'airport is full'
  end

end
