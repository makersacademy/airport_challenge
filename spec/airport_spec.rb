require 'airport'

describe Airport do
  it { is_expected.to respond_to(:tell_plane_to_land).with(1).argument }

    it 'should land a plane' do
      plane = Plane.new

      subject.tell_plane_to_land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

end
