require 'airport'

describe Airport do
  describe '#initialize' do
    it { is_expected.to respond_to(:hangar) }
    
    let(:plane) { double :plane}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock_landing_plane(plane) }
      expect { subject.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end

    it 'can specify a different capacity' do
      port = Airport.new(20)
      20.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end
  end

  describe '#dock_landing_plane' do
    it { is_expected.to respond_to(:dock_landing_plane).with(1).argument }

    let(:plane) { double :plane }
    it 'is able to receive and store plane in hangar' do
      expect(subject.dock_landing_plane(plane)).to eq([plane])
    end
  end

  describe '#release_for_takeoff' do
    it { is_expected.to respond_to(:release_for_takeoff) }

    let(:plane) { double :plane }
    it 'is able to release stored planes for takeoff' do
      subject.dock_landing_plane(plane)
      expect(subject.release_for_takeoff).to eq(plane)
    end

    it 'raises an error if no planes are stored' do
      expect { subject.release_for_takeoff }.to raise_error 'No planes in hangar'
    end
  end
end
