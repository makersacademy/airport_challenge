require 'airport'
require 'plane'

describe 'Airport at full capacity' do
  it 'Will not allow further plane to land at default capacity -  error will be raised' do
    weather = Weather.new
    airport = Airport.new(weather)
    allow(weather).to receive(:rand).and_return(3)
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport at full capacity'
  end
  it 'Will not allow further planes to land - capacity overidden to new capacity' do
    weather = Weather.new
    airport = Airport.new(weather)
    allow(weather).to receive(:rand).and_return(3)
    airport.capacity = 10
    airport.capacity.times { airport.land(Plane.new) }
  end
end
