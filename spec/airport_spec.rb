require 'airport'

describe Airport do

  describe '#capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end

    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq Airport::CAPACITY
    end
  end

  it { is_expected.to respond_to :instruct_take_off }
  it { is_expected.to respond_to(:allow_landing).with(1).argument }

  describe '#instruct_takeoff' do
    it 'allows take-off' do
      allow(subject).to receive(:stormy?) { false }
      plane = double :plane
      subject.allow_landing(plane)
      subject.instruct_take_off(plane)
      expect(subject).to be_empty
    end

    it 'raises error during stormy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.instruct_take_off double(:plane) }.to raise_error "Take off denied due to bad weather"
    end

  end

  describe '#allow_landing' do
    it 'lands a plane' do
      allow(subject).to receive(:stormy?) { false }
      subject.allow_landing double :plane
      expect(subject).not_to be_empty
    end

    it 'raises error during stromy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.allow_landing double(:plane) }.to raise_error "Landing denied due to bad weather"
    end

    it 'raises error when over capacity' do
      allow(subject).to receive(:stormy?) { false }
      subject.capacity.times { subject.allow_landing double(:plane) }
      expect { subject.allow_landing double(:plane) }.to raise_error "#{described_class.name} full"
    end
  end
end
