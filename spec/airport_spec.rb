require 'airport'

describe Airport do
  let(:plane) { double :plane }

  before(:each) { allow(subject).to receive(:weather_stormy?).and_return(false) }

  describe '#capacity' do
    it { is_expected.to respond_to :capacity }

    it 'returns an Integer' do
      expect(subject.capacity).to be_kind_of(Integer)
    end

    it 'has a default value of 20' do
      expect(subject.capacity).to eq 20
    end

    it 'can be overridden' do
      subject.capacity = 42
      expect(subject.capacity).to eq 42
    end
  end

  describe '#approve_landing' do
    it { is_expected.to respond_to(:approve_landing).with(1).argument }

    it 'takes a plane as an argument and stores it in the hangar' do
      subject.approve_landing(plane)
      expect(subject.in_hangar?(plane)).to be_truthy
    end

    it 'raises an error when a plane tries to land while hangar is full' do
      allow(subject).to receive(:max_capacity?).and_return(true)
      expect { subject.approve_landing(plane) }.to raise_error("Airport is at maximum capacity")
    end
  end

  describe '#approve_take_off' do
    before(:each) { subject.approve_landing(plane) }

    it { is_expected.to respond_to(:approve_take_off).with(1).argument }

    it 'takes a plane as an argument and removes it from the hangar' do
      subject.approve_take_off(plane)
      expect(subject.in_hangar?(plane)).not_to be_truthy
    end
  end

  context 'when weather is stormy' do
    before(:each) { allow(subject).to receive(:weather_stormy?).and_return(true) }

    describe '#approve_landing' do
      it 'raises an error' do
        expect { subject.approve_landing(plane) }.to raise_error("Weather conditions are too unsafe for landing")
      end
    end

    describe '#approve_take_off' do
      it 'raises an error' do
        expect { subject.approve_take_off(plane) }.to raise_error("Weather conditions are too unsafe for take off")
      end
    end
  end
end
