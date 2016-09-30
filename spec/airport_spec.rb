require 'airport'

describe Airport do
  it 'can confirm that 1 plane has landed' do
## Arrange
    new_plane = Plane.new
## Act
    subject.confirm_land(new_plane)
## Assert
    expect(subject.planes.count).to eq 1
  end

  it 'can confirm that a plane has landed and the correct plane is in a slot' do
## Arrange
    new_plane = Plane.new
## Act
    subject.confirm_land(new_plane)
## Assert
    expect(subject.planes[-1]).to eq new_plane
  end

  it 'can confirm that a plane has landed' do
## Arrange
    new_plane = Plane.new
## Act
    # subject.confirm_land(new_plane)
## Assert
    expect(subject.confirm_land(new_plane)).to eq subject.planes
  end
end
