require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Grand Finale' do
  before do
    allow($stdout).to receive(:puts)
  end
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  before do
    allow(airport.control_tower).to receive(:stormy?).and_return(false)
  end
  scenario 'all planes can land and all planes can take off' do
    airport.park(plane)
    plane.take_off_from(airport)
    plane.land_to(airport)
    expect(airport.planes).to eq([plane])
    expect(plane).not_to be_flying
  end
  scenario 'planes can take off from an airport and land in a different one' do
    another_airport = Airport.new
    allow(another_airport.control_tower).to receive(:stormy?).and_return(false)
    airport.park(plane)
    plane.take_off_from(airport)
    plane.land_to(another_airport)
    expect(airport.planes).to eq([])
    expect(another_airport.planes).to eq([plane])
  end
end
