require 'airport'

describe Airport do
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe 'capacity' do
    subject { Airport.new}
    let(:plane) { double :plane }

    it 'raises error when no planes in airport' do
      expect { subject.take_off(plane) }.to raise_error 'no planes in airport'
    end

    it 'airport capacity is full' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'airport is full'
    end

    it 'has default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'land' do
    let(:plane) { double :plane }
    it 'can land the plane' do
      subject.land(plane)
      expect(subject.airport).to include(plane)
    end
  end

  describe 'take_off' do
    let(:plane) { double :plane }
    it "plane takes off" do
      subject.land(plane)
      take_off_plane = subject.take_off(plane)
      expect(subject.airport).to_not include(plane)
    end
  end
end
