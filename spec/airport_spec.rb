require 'airport'

describe Airport do
  plane = Plane.new
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:plane) }

  describe '#land_plane' do
    it 'allows plane to land' do
      expect(subject.land(plane)).to eq plane
    end

    it 'an instance of a plane landed' do
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
  end

  describe '#take_off' do
    it 'a plane can take off' do
      plane = subject.take_off
    end
  end
end
