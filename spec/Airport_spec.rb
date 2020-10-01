require "Airport"

describe Airport do
  # Arrange
  before(:each) do
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

  it "won't land a plane if at capacity" do
    # Arrange
    Airport::CAPACITY.times { @airport.land(Plane.new) }
    # Assert
    expect { @airport.land(Plane.new) }.to raise_error "Airport is full."
  end
end
