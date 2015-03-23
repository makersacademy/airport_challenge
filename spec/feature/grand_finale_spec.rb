require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  xscenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    all_planes = Array.new(6, Plane.new)
    allow(airport).to receive(:weather){:'!sunny'}
    
    for plane in @all_plane do airport.landing_order(plane)
    for plane in @all_plane do expect(plane.flying).to eq false
    for plane in @all_plane do airport.takeoff_order(plane)
    for plane in @all_plane do expect(plane.flying).to eq true
  end
end
