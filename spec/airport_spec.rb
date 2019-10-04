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

  it 'can get a plane to take off' do
    # Arrange
    plane = Plane.new
    # Act
    subject.land_plane(plane)
    subject.take_off_plane(plane)
    # Assert
    expect(subject.hanger).to_not include(plane)
  end

  it 'can prevent planes from landing when hanger is full' do
    # Arrange
    plane = Plane.new
    # Act
    subject.capacity.times { subject.land_plane Plane.new }
    # Assert
    expect { raise subject.land_plane(plane) }.to raise_error 'Hanger is full.'
  end
end
