require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it 'lets a plane land' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq [plane]
  end

end
