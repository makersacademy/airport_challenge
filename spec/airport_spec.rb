require 'airport'

describe Airport do
  it { is_expected.to respond_to :land_plane }

  it { is_expected.to respond_to(:plane_departed?).with(1).argument }
  it 'departs a plane' do
    plane = subject.plane_departed?(Plane.new)
    expect(plane).to eq plane
  end

end
