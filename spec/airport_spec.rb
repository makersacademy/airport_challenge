require 'airport'
describe Airport do

  # it 'has an airport that can instruct planes' do

  it 'can land a plane' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'can tell a plane to take off' do
    expect(subject).to respond_to(:take_off_plane)
  end

  it 'confirms the plane is no longer at the airport' do
    plane = Plane.new
    expect(subject.take_off_plane(plane)).to eq "Plane has left the airport"
  end
end
