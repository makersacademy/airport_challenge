require 'airport.rb'

describe Airport do
  it 'can land a plane' do
    # Arrange
    plane = Plane.new
    # Act
    subject.land_plane(plane)
    # Assert
    expect(subject.hanger).to include(plane)
  end
end
