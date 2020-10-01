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
    expect(@airport.plane).to eq @plane
  end
end
