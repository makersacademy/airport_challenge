require 'airport'

describe Airport do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane at the airport' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'causes a plane to takeoff' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end
  end
end
