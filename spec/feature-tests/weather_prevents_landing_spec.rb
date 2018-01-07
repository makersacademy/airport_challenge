require 'airport'
require 'plane'

context 'Weather is stormy' do
  it 'should not allow planes to land' do
    airport = Airport.new
    plane = Plane.new
    allow(airport.weather).to receive(:stormy?).and_return true
    expect { airport.land plane }.to raise_error 'Could not complete landing due to weather'
  end
end
