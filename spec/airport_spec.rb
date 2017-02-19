require 'airport'

describe Airport do

  it 'Land a plane' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane

  end

end
