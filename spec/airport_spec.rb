require 'airport'

describe Airport do

  it 'checks whether or not a plane is in the airport' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.check_plane_status(plane)).to eq "Plane in airport"
    plane.take_off(subject)
    expect(subject.check_plane_status(plane)).to eq "Plane not in airport"
  end

end
