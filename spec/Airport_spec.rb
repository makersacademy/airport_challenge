require "Airport"

describe Airport do
  # Arrange
  before(:all) do
    @plane = Plane.new
    @airport = Airport.new
  end
  it "can land a plane" do
    # Act
    @airport.land(@plane)

    # Assert
    expect(@airport.planes).to include @plane
  end

  it "can let a plane takeoff" do
    # Arrange
    @airport.land(@plane)
    # Act
    @airport.takeoff(@plane)
    # Assert
    expect(@airport.planes).to_not include @plane
  end
end
