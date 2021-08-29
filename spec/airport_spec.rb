require 'airport'

describe Airport do
  describe '#initialize' do
    let(:plane) { double :plane }
    let(:port) { Airport.new }
    
    it { is_expected.to respond_to(:hangar) }
    
    it 'defaults capacity' do
      allow(port).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end

    it 'can specify a different capacity' do
      port = Airport.new(20)
      allow(port).to receive(:stormy?).and_return(false)
      20.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end
  end

  describe '#dock_landing_plane' do
    let(:plane) { double :plane }
    let(:port) { Airport.new }

    it 'is able to receive and store plane in hangar' do
      allow(port).to receive(:stormy?).and_return(false)
      expect(port.dock_landing_plane(plane)).to eq([plane])
    end

    it 'raises an error if hangar is full' do
      allow(port).to receive(:stormy?).and_return(false)
      10.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end

    it 'raises an error if weather is stormy' do
      allow(port).to receive(:stormy?).and_return(true)
      expect { port.dock_landing_plane(plane) }.to raise_error 'Weather is stormy'
    end
  end

  describe '#release_for_takeoff' do
    let(:plane) { double :plane }
    let(:port) { Airport.new }

    it 'is able to release stored planes for takeoff' do
      allow(port).to receive(:stormy?).and_return(false)
      port.dock_landing_plane(plane)
      expect(port.release_for_takeoff).to eq(plane)
    end

    it 'raises an error if no planes are stored' do
      expect { subject.release_for_takeoff }.to raise_error 'No planes in hangar'
    end

    it 'raises an error if weather is stormy' do
      allow(port).to receive(:stormy?).and_return(false)
      port.dock_landing_plane(plane)
      allow(port).to receive(:stormy?).and_return(true)
      expect { port.release_for_takeoff }.to raise_error 'Weather is stormy'
    end
  end

  describe '#stormy?' do
    let(:port) { Airport.new }

    it 'likely (7/10 chance) to return false' do
      allow(port).to receive(:rand).and_return(1)
      expect(port.stormy?).to eq false      
    end

    it 'unlikely (3/10 chance) to return true' do
      allow(port).to receive(:rand).and_return(8)
      expect(port.stormy?).to eq true
    end
  end
end
