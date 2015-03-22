require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Storm' do
  before do
    allow($stdout).to receive(:puts)
  end
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'planes cannot take off during a storm' do
    allow(airport.control_tower).to receive(:stormy?).and_return(true)
    airport.park(plane)
    expect { plane.take_off_from airport }.to raise_error
  end
  scenario 'planes cannot land in an airport during a storm' do
    another_airport = Airport.new
    allow(airport.control_tower).to receive(:stormy?).and_return(false)
    allow(another_airport.control_tower).to receive(:stormy?).and_return(true)
    airport.park(plane)
    plane.take_off_from(airport)
    expect { plane.land_to another_airport }.to raise_error
  end
end
