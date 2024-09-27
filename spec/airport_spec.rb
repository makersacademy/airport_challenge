require 'airport'

describe Airport do
  describe '#initialize' do
    let(:plane) { double :plane }
    let(:port) { described_class.new }
    
    it 'defaults capacity' do
      allow(plane).to receive(:landed).and_return(true)
      described_class::DEFAULT_CAPACITY.times { port.dock_landed_plane(plane) }
      expect { port.dock_landed_plane(plane) }.to raise_error 'Hangar is full'
    end

    it 'can specify a different capacity' do
      allow(plane).to receive(:landed).and_return(true)
      port = described_class.new(20)
      20.times { port.dock_landed_plane(plane) }
      expect { port.dock_landed_plane(plane) }.to raise_error 'Hangar is full'
    end
  end

  describe '#dock_landed_plane' do
    let(:plane) { double :plane }
    let(:port) { described_class.new }

    it 'is able to receive and store plane in hangar if plane is landed' do
      allow(plane).to receive(:landed).and_return(true)
      expect(port.dock_landed_plane(plane)).to eq([plane])
    end

    it 'raises an error if plane is flying' do
      allow(plane).to receive(:landed).and_return(false)
      expect { port.dock_landed_plane(plane) }.to raise_error 'Plane is flying and cannot be docked'
    end

    it 'raises an error if hangar is full' do
      allow(plane).to receive(:landed).and_return(true)
      10.times { port.dock_landed_plane(plane) }
      expect { port.dock_landed_plane(plane) }.to raise_error 'Hangar is full'
    end
  end

  describe '#release_for_takeoff' do
    let(:plane) { double :plane }
    let(:port) { described_class.new }

    it 'is able to release stored planes for takeoff' do
      allow(plane).to receive(:landed).and_return(true)
      port.dock_landed_plane(plane)
      expect(port.release_for_takeoff).to eq(plane)
    end

    it 'raises an error if no planes are stored' do
      expect { subject.release_for_takeoff }.to raise_error 'No planes in hangar'
    end
  end
end
