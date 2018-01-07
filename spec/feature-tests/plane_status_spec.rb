require 'airport'
require 'plane'

describe 'Plane status' do
  plane = Plane.new
  airport = Airport.new
  before do
    allow(airport.weather).to receive(:stormy?).and_return false
  end
  it 'checks if a plane is flying on instantiation' do
    expect(plane.status).to eq :flying
  end
  it 'checks the status of a plane that has landed' do
    airport.land(plane)
    expect(plane.status).to eq :parked
  end
  it 'checks the status of a plane that has departed' do
    airport.take_off
    expect(plane.status).to eq :flying
  end
end
