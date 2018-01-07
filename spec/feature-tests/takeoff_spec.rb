require 'airport'
require 'plane'

describe 'Taking off' do
  airport = Airport.new
  plane = Plane.new
  before do
    allow(airport.weather).to receive(:stormy?).and_return false
  end
  it 'a plane should be able to take off' do
    airport.land plane
    airport.take_off plane
    expect(airport.planes).to be_empty
  end
end
