require 'capybara/rspec'
require 'plane'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  context'in good weather'
    scenario 'all planes can land and all planes can take off' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:weather).and_return("Sunny")
      6.times { airport.land plane }
      6.times { airport.take_off }
      expect(airport.plane_check).to eq []
    end
  end
