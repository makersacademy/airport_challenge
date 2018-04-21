require 'airport'

describe Airport do
planes = Plane.new

  it 'lands a plane' do
  expect(subject).to respond_to(:land_plane).with(1).argument
  expect(subject.land_plane(planes)).to include planes
  end

  it 'instructs a plane to take off' do
    expect(subject).to respond_to(:plane_depart)
    subject.land_plane(planes)
    expect(subject.plane_depart).to eq planes
  end
end
