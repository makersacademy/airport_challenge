require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to(:take_off) }

  let (:plane) { Plane.new }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#planes' do
    it 'returns landed planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'removes a plane' do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end
  end
end
