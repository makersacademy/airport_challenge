require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }

  describe '#initialize' do
    it 'accept a capacity when initializing' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end
    it 'default capacity should be DEFAULT_CAPACITY' do
      airport = Airport.new
      expect(airport.capacity).to eq ::DEFAULT_CAPACITY
    end
  end

  describe '#take off' do
    it 'take off from airport' do
      airport = Airport.new
      expect(airport).to receive(:storm).and_return(false)
      plane = double(:plane)
      airport.hanger << plane
      expect(airport.take_off).to eq plane
    end
    it 'prevent take off in stormy weather' do
      airport = Airport.new
      expect(airport).to receive(:storm).and_return(true)
      plane = double(:plane)
      airport.hanger << plane
      expect { airport.take_off }.to raise_error "Can't take off due to stormy weather"
    end
  end

  it 'confirm taken off' do
    airport = Airport.new
    expect(airport).to receive(:storm).and_return(false)
    plane = double(:plane)
    airport.hanger << plane
    airport.take_off
    expect(airport.taken_off?).to eq 0
  end

  describe '#land' do
    it 'land at airport' do
      airport = Airport.new
      expect(airport).to receive(:storm).and_return(false)
      plane = double(:plane)
      expect(airport.land(plane)).to eq [plane]
    end
    it 'raises an error when airport full' do
      airport = Airport.new
      plane = double(:plane)
      ::DEFAULT_CAPACITY.times { airport.hanger << plane }
      expect { airport.land(plane) }.to raise_error "Airport full"
    end
    it 'prevent landing in stormy weather' do
      airport = Airport.new
      expect(airport).to receive(:storm).and_return(true)
      plane = double(:plane)
      expect { airport.land(plane) }.to raise_error "Can't land due to stormy weather"
    end
  end
end
