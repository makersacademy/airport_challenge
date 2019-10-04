require 'airport'

describe Airport do

  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe 'capacity and values' do
    subject { Airport.new }
    let(:plane) { double :plane }

    it 'raises an error for no planes in airport' do
      expect { subject.takeoff }.to raise_error 'No planes in airport'
    end

    it 'airport capacity is full' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'airport is full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'takeoff' do
    let(:plane) { double :plane }
    it 'plane takes off correctly' do
      plane = double(:flying? => true)
      subject.land(plane)
      takeoff_plane = subject.takeoff
      expect(takeoff_plane).to be_flying
    end
  end
end
