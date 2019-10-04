require 'airport'

describe Airport do
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe 'capacity' do
    subject { Airport.new}
    let(:plane) { double :plane }

    it 'raises error when no planes in airport' do
      expect { subject.take_off }.to raise_error 'no planes in airport'
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


  describe 'take_off'
    it 'confirms plane has taken off' do
      20.times { subject.land(plane.new) }
      expect(subject.airport.last).to eq(subject.airport.pop)
    end
  end
