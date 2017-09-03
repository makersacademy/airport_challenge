require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double:plane }
  let(:weather) { double:weather }

  describe '#land' do
    before do
      allow(airport.weather).to receive(:stormy?).and_return(false)
    end
    it 'allows an airport to accept a landing plane' do
      expect(airport.land(plane)).to eq [plane]
    end
    it 'raises an error when the airport is full' do
      airport.capacity.times {  airport.land double(:plane) }
      expect { airport.land plane }.to raise_error 'Airport is full'
    end
    it 'raises an error when the plane has already landed' do
      airport.land(plane)
      expect {airport.land(plane)}.to raise_error 'Plane has already landed'
    end
  end

  describe '#take_off' do
    before do
      allow(airport.weather).to receive(:stormy?).and_return(false)
    end
    it 'allows a plane to take off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it 'raises an error if there is no plane' do
      expect { airport.take_off(plane) }.to raise_error 'Plane is not at the airport'
    end
    it 'raises an error if the same plane takes off twice' do
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error 'Plane is not at the airport'
    end
  end

  context 'when it is stormy' do
    it 'raises an error when a plane tries to land in stormy weather' do
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Cannot land in stormy weather'
    end
    it 'raises an error when a plane tries to take off in stormy weather' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off in stormy weather'
    end
  end

  it 'has a default capacity for planes' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
