require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :plane }

  let (:plane) { Plane.new }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#plane' do
    it 'returns a landed plane' do
      subject.land(plane)
      expect(subject.plane).to be plane
    end
  end
end
