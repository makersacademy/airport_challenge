require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  describe '#new' do
    it 'returns a new airport object' do
      expect(subject).to be_an_instance_of(Airport)
    end

    OVERWRITE_CAPACITY = 50
    subject { described_class.new(OVERWRITE_CAPACITY) }
    it 'is expected to overwrite airport defafault capacity' do
      expect(subject.capacity).to eq OVERWRITE_CAPACITY
    end
  end

  describe '#land' do
    context 'responds to the land method' do
      it { is_expected.to respond_to(:land) }
    end

    context 'responds to one argument' do
      it { is_expected.to respond_to(:land).with(1).argument }
    end

    it 'instructs plane to land' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.hangar_planes).to eq [plane]
    end

    it 'has the plane after landing' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.land(plane)).to include plane
    end

    it 'raise and error and prevent landing when the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true
      message = "Weather is stormy. No landing is allowed!"
      expect { subject.land(plane) }.to raise_error message
    end

    it 'does not raise an error when the storm is cleared' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.to_not raise_error
    end

    it 'raise an exception when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      message = 'Airport full! No landing permitted.'
      expect { subject.land(plane) }.to raise_error message
    end
  end

  describe '#take_off' do
    context 'responds to take_off' do
      it { is_expected.to respond_to(:take_off) }
    end

    context 'responds to one argument' do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    it 'takes off and it confirms the plane is not in the airport' do
      allow(plane).to receive(:takeoff)
      expect(subject.take_off(plane)).to eq nil
    end

    it 'prevents to takeoff when weather is stormy?' do
      allow(subject).to receive(:stormy?).and_return true
      message = "Weather is stormy. No takeoff is allowed!"
      expect { subject.take_off(plane) }.to raise_error message
    end
  end

  describe '#stormy' do
    context 'respond to stormy?' do
      it { is_expected.to respond_to(:stormy?) }
    end

    it 'returns true or false based on the weather' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end

end
