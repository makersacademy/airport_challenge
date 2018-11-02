require 'airport'

describe Airport do
  it { is_expected.to respond_to :plane }
end

describe Airport do
  it { is_expected.to respond_to :land_plane }
end

describe Airport do
  it { is_expected.to respond_to :take_off }
end

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1) }
end

describe Airport do
  it 'lands one plane' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.land_plane(plane)).to eq plane
  end
end
