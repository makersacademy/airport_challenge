require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#landing' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'allows a plane to land at an airport' do
      allow(plane).to receive(:land).and_return([plane])
    end
    it 'prevents landing when the airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }
    it 'allows a plane to takeoff from an airport' do
      allow(plane).to receive(:takeoff)
    end
    it 'allows a plane to takeoff from an airport and confirms that it is no longer in the airport' do
      subject.land(plane)
      subject.takeoff
      expect(subject.planes).not_to include(plane)
    end
  end

  describe '#airport status' do
    describe '#capacity' do
      it { is_expected.to respond_to :capacity }
      it 'has a default capacity of 10 when initialized with no argument given' do
        expect(subject.capacity).to eq 10
      end
      it 'has a capacity that can be overidden with an argument' do
        airport = Airport.new(20)
        expect(airport.capacity).to eq 20
      end
    end
    it { is_expected.to respond_to :planes }
    it 'returns an empty array when there are no planes at the airport' do
      expect(subject.planes).to eq Array.new
    end
  end
end
