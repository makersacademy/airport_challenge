require 'airport'

describe Airport do
  airport = Airport.new
  let(:plane) { double :plane }

  describe '#land' do
    it 'raises an error if plane tries to land when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(:plane) }.to raise_error "Plane cannot land. Weather is stormy."
    end
    it 'tells plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
      allow(airport).to receive(:stormy?).and_return false
    end
    it 'prevents plane from landing if airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times do 
        airport.land(:plane)
      end
      expect { airport.land(:plane) }.to raise_error "Plane cannot land. Airport is full."
    end
    
  end

  describe '#take_off' do
    it 'tells plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it 'raises an error if plane tries to take off when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(:plane) }.to raise_error "Plane cannot take off. Weather is stormy."
    end
  end
end
