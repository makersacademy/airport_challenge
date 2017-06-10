require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq subject.planes.last
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'gets a plane to take off' do
      subject.land(Plane.new)
      subject.take_off
      expect(subject.planes.length).to eq 0
    end
  end
end
