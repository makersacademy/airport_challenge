require 'airport'

describe Airport do
  it { is_expected.to respond_to(:tell_plane_to_land).with(1).argument }

    it 'should land a plane' do
      plane = Plane.new

      subject.tell_plane_to_land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it { is_expected.to respond_to(:tell_plane_to_take_off).with(1).argument }

    it 'should let a plane take off' do
      plane = Plane.new
      subject.tell_plane_to_land(plane)
      subject.tell_plane_to_take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end


end
