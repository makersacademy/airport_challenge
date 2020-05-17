require 'airport'

describe Airport do
  let(:plane) { double :plane }

  before(:each) { allow(subject).to receive(:weather_stormy?).and_return(false) }

  describe '#capacity' do
    it { is_expected.to respond_to :capacity }

    it 'returns an Integer' do
      expect(subject.capacity).to be_kind_of(Integer)
    end

    it 'has a default value' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be overridden' do
      [1, 12, 123].each do |cap|
        subject.capacity = cap
        expect(subject.capacity).to eq cap
      end
    end
  end

  describe '#request_landing' do
    it { is_expected.to respond_to(:request_landing).with(1).argument }

    it 'takes a plane as an argument and stores it in hangar' do
      subject.request_landing(plane)
      expect(subject.in_hangar?(plane)).to be_truthy
    end

    it 'raises an error when hangar is at maximum capacity' do
      allow(subject).to receive(:in_hangar?).with(plane).and_return(false)
      subject.capacity.times { subject.request_landing(plane) }
      expect { subject.request_landing(plane) }.to raise_error("Airport is at maximum capacity")
    end

    it 'raises an error when plane is already in hangar' do
      allow(subject).to receive(:in_hangar?).with(plane).and_return(true)
      expect { subject.request_landing(plane) }.to raise_error("Plane is already in hangar")
    end
  end

  describe '#request_take_off' do
    before(:each) { subject.request_landing(plane) }

    it { is_expected.to respond_to(:request_take_off).with(1).argument }

    it 'takes a plane as an argument and removes it from the hangar' do
      allow($stdout).to receive(:puts) # suppress console output
      subject.request_take_off(plane)
      expect(subject.in_hangar?(plane)).not_to be_truthy
    end

    it 'confirms when plane is no longer in hangar' do
      expect { subject.request_take_off(plane) }.to output("[plane has taken off from airport]\n").to_stdout
    end

    it 'raises an error when plane is not currently in hangar' do
      allow(subject).to receive(:in_hangar?).with(plane).and_return(false)
      expect { subject.request_take_off(plane) }.to raise_error("Plane is not currently in hangar")
    end
  end

  context 'when weather is stormy' do
    before(:each) { allow(subject).to receive(:weather_stormy?).and_return(true) }

    describe '#request_landing' do
      it 'raises an error' do
        expect { subject.request_landing(plane) }.to raise_error("Weather conditions are too unsafe")
      end
    end

    describe '#request_take_off' do
      it 'raises an error' do
        allow(subject).to receive(:in_hangar?).with(plane).and_return(true)
        expect { subject.request_take_off(plane) }.to raise_error("Weather conditions are too unsafe")
      end
    end
  end
end
