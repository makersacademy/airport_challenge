require "Airport"

describe Airport do
  # Arrange
  before(:each) do
    @plane = Plane.new
    @airport = Airport.new
    @sky = Sky.new
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
    # Act
    Airport::CAPACITY.times { @airport.land(Plane.new) }
    # Assert
    expect { @airport.land(Plane.new) }.to raise_error "Airport is full."
  end

  # it "won't allow takeoff if weather is stormy" do
  #   # Arrange
  #   allow(@sky).to receive(:rand) { 1 }
  #   expect(@airport.takeoff(@plane)).to raise_error "The sky is too stormy too fly."
  # end
end
