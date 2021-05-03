require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :land_plane }
  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq(plane)
  end

  #it { is_expected.to respond_to :takeoff_plane }

end