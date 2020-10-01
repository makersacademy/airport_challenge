require "Plane"

describe Plane do
  # Arrange
  before(:all) do
    @plane = Plane.new
    @airport = Airport.new
  end
  it "can land at an airport" do
    # Act
    @plane.land(@airport)

    # Assert
    expect(@plane.airport).to eq @airport
  end
end
