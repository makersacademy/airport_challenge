require 'airport'

describe Airport do
  describe '#initialize' do
    it { is_expected.to respond_to(:hangar) }
    
    let(:plane) { double :plane}
    let(:port) { Airport.new }
    it 'defaults capacity' do
      allow(port).to receive(:check_weather).and_return('sunny')
      described_class::DEFAULT_CAPACITY.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end

    it 'can specify a different capacity' do
      port = Airport.new(20)
      allow(port).to receive(:check_weather).and_return('sunny')
      20.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end
  end

  describe '#dock_landing_plane' do
    it { is_expected.to respond_to(:dock_landing_plane).with(1).argument }

    let(:plane) { double :plane }
    let(:port) { Airport.new }
    it 'is able to receive and store plane in hangar' do
      allow(port).to receive(:check_weather).and_return('sunny')
      expect(port.dock_landing_plane(plane)).to eq([plane])
    end

    it 'raises an error if hangar is full' do
      allow(port).to receive(:check_weather).and_return('sunny')
      10.times { port.dock_landing_plane(plane) }
      expect { port.dock_landing_plane(plane) }.to raise_error 'Hangar is full'
    end

    it 'raises an error if weather is stormy' do
      allow(port).to receive(:check_weather).and_return('stormy')
      expect { port.dock_landing_plane(plane) }.to raise_error 'Weather is stormy'
    end
  end

  describe '#release_for_takeoff' do
    it { is_expected.to respond_to(:release_for_takeoff) }

    let(:plane) { double :plane }
    let(:port) { Airport.new }
    it 'is able to release stored planes for takeoff' do
      allow(port).to receive(:check_weather).and_return('sunny')
      port.dock_landing_plane(plane)
      expect(port.release_for_takeoff).to eq(plane)
    end

    it 'raises an error if no planes are stored' do
      expect { subject.release_for_takeoff }.to raise_error 'No planes in hangar'
    end

    it 'raises an error if weather is stormy' do
      allow(port).to receive(:check_weather).and_return('sunny')
      port.dock_landing_plane(plane)
      allow(port).to receive(:check_weather).and_return('stormy')
      expect { port.release_for_takeoff }.to raise_error 'Weather is stormy'
    end
  end
end
