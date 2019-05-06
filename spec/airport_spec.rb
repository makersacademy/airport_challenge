require 'airport'

describe Airport do
  plane = Plane.new
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:planes) }

  describe '#land_plane' do
    it 'allows plane to land' do
      expect(subject.land(plane)).to include plane
    end

    it 'an instance of a plane landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#take_off' do
    it 'a plane can take off' do
      plane = subject.take_off
    end

    it 'confirm plane has taken off' do
      subject.land(plane)
      subject.take_off
      expect(subject.planes.count).to eq(0)
    end
  end
end
