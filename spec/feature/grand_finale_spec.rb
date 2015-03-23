require 'capybara/rspec'

feature 'Grand Finale' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  scenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    all_planes = Array.new(6, Plane.new)
    allow(airport).to receive(:weather) { :'!stormy' }

    all_planes.each { |plane| airport.landing_order(plane) }
    all_planes.each { |plane| expect(plane.flying).to eq false }
    all_planes.each { |plane| airport.takeoff_order(plane) }
    all_planes.each { |plane| expect(plane.flying).to eq true }
  end
end
