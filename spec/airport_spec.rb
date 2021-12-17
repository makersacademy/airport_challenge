require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:hangar) }

  it { is_expected.to respond_to(:send_to_hangar).with(1).argument }
  describe '#send_to_hangar' do
    it 'stores a plane in the hangar' do
      expect(subject.send_to_hangar(plane)).to eq plane
    end
  end

  it { is_expected.to respond_to(:taxi_to_runway).with(1).argument }
  describe '#taxi_to_runway' do
    it 'taxis a plane to the runway' do
      expect(subject.taxi_to_runway(plane)).to eq ""
    end
  end

  it { is_expected.to respond_to(:full?) }
  describe '#full?' do
    it 'returns false when hanger is empty' do
      expect(subject.full?).to eq false
    end
    it 'returns true when hangar is full' do
      subject.send_to_hangar(plane)
      expect(subject.full?).to eq true
    end
  end
end
