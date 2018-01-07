require 'airport'
require 'plane'

context 'Airport is full' do
  it 'should not allow planes to land (default capacity)' do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?).and_return false
    plane = Plane.new
    Airport::DEFAULT_CAPACTITY.times { airport.land plane }
    expect { airport.land plane }.to raise_error 'Cannot land because airport is full'
  end

  it 'should not allow planes to land (given capacity)' do
    custom_capacity = 5
    airport = Airport.new(custom_capacity)
    allow(airport.weather).to receive(:stormy?).and_return false
    plane = Plane.new
    airport.capacity.times { airport.land plane }
    expect { airport.land plane }.to raise_error 'Cannot land because airport is full'
  end
end
