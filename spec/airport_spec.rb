require 'airport'

describe Airport do
  it 'lands a plane' do
  expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'instructs plane to takeoff' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'confirms plane is no longer at the airport' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff).to eq plane
  end
end
