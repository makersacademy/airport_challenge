require "Airport"

describe Airport do
  # Arrange
  before(:each) do
    @plane = Plane.new
  end
  it "can land a plane" do
    # Act
    subject.land(@plane)

    # Assert
    expect(subject.planes).to include @plane
  end

  it "can let a plane takeoff" do
    # Arrange
    allow(subject.sky).to receive(:rand) { 5 }
    subject.sky.change_weather
    subject.land(@plane)
    # Act
    subject.takeoff(@plane)
    # Assert
    expect(subject.planes).to_not include @plane
  end

  it "won't land a plane if at capacity" do
    # Act
    Airport::CAPACITY.times { subject.land(Plane.new) }
    # Assert
    expect { subject.land(Plane.new) }.to raise_error "Airport is full."
  end

  it "won't allow takeoff if weather is stormy" do
    # Arrange
    allow(subject.sky).to receive(:rand) { 1 }
    # Act
    subject.sky.change_weather
    # Assert
    expect { subject.takeoff(@plane) }.to raise_error "The sky is too stormy to fly."
  end
end
