require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#landing' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'allows a plane to land at an airport' do
      allow(plane).to receive(:land).and_return([plane])
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'allows a plane to takeoff from an airport' do
      allow(plane).to receive(:takeoff)
    end
    it 'allows a plane to takeoff from an airport and confirms that it is no longer in the airport' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).to eq Array.new
    end
  end

  describe '#airport status' do
    it { is_expected.to respond_to :planes }
    it 'returns an empty array when there are no planes at the airport' do
      expect(subject.planes).to eq Array.new
    end
  end
end
