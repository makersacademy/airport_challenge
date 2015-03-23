require 'capybara/rspec'

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
