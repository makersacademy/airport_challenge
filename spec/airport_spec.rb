require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it 'stores planes' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end
end
