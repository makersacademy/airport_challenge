require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  let(:sunny_weather) { double :weather, stormy?: false }
  
  it 'initialized with default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  
  it 'initialized with specified capacity' do
    airport = described_class.new(50, weather)
    expect(airport.capacity).to eq 50
  end

  describe '#land' do

    it 'can land a plane' do
      allow(weather).to receive(:stormy?).and_return false
      expect(airport.land(plane)).to eq "Plane landed!"
    end
    
    it 'doesn\'t land a plane when the weather is stormy' do
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error(RuntimeError, 'Too stormy to land!')
    end
    
    it 'doesn\'t land a plane when there\'s no space' do
      allow(weather).to receive(:stormy?).and_return false
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error(RuntimeError, 'No extra space!')
    end
    
    it 'when plane landed, it\'s in the airport' do
      allow(weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.landed_planes).to include plane
    end
  end

  describe '#take_off' do
    
    it 'can let plane take off' do
      expect(airport.take_off).to eq "Plane took off!"
    end

    it 'does not let plane take off when the weather is stormy' do
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.take_off }.to raise_error(RuntimeError, 'Too stormy to fly!')
    end

    it 'when plane took off, there\'s an extra space' do
      allow(weather).to receive(:stormy?).and_return false
      airport.capacity.times { airport.land(plane) }
      airport.take_off
      expect(airport.landed_planes.count).to eq(airport.capacity - 1)
    end
  end

end