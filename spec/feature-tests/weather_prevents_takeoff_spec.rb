require 'airport'
require 'plane'

context 'Weather is stormy' do
  it 'should not allow planes to take off' do
    airport = Airport.new
    plane = Plane.new
    allow(airport.weather).to receive(:stormy?).and_return false
    airport.land plane
    allow(airport.weather).to receive(:stormy?).and_return true
    expect { airport.take_off }.to raise_error 'Could not complete takeoff due to weather'
  end
end
