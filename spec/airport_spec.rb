require 'airport'

describe Airport do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  describe "Landing a plane at an aiport" do
    it "should show the plane to be in the hangar" do
    # airport = Airport.new
    allow(subject.weather).to receive(:stormy?).and_return(false)
    plane = Plane.new
    subject.land(plane)
    expect(subject.hangar).to include plane
    end
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport
  # and confirm that it is no longer in the airport

  describe "Plane takes off from an airport" do
    it "should show the plane is no longer in the hangar" do
      # airport = Airport.new
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to_not include plane
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  describe "Planes take off when the weather is clear" do
    it "should allow a plane to take off and not return error" do
    plane = Plane.new
    error = 'Unable to take off due to stormy weather'
    allow(subject.weather).to receive(:stormy?).and_return(false)
    expect { subject.take_off(plane) }.not_to raise_error error
    end
  end

  describe "Planes attempts take off when the weather is stormy" do
    it "should not allow the plane to take off and raise an error" do
    # airport = Airport.new
    allow(subject.weather).to receive(:stormy?).and_return(true)
    plane = Plane.new
    error = 'Unable to take off due to stormy weather'
    expect { subject.take_off(plane) }.to raise_error error
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  describe "Plane tries to land when it is clear" do
    it "should allow the plane to land and not raise an error" do
      # airport = Airport.new
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      error = 'Unable to land due to stormy weather'
      expect { subject.land(plane) }.to_not raise_error error
    end
  end

  describe "Plane tries to land when it is stormy" do
    it "should should not allow the plane to land and raise an error" do
      # airport = Airport.new
      allow(subject.weather).to receive(:stormy?).and_return(true)
      plane = Plane.new
      error = 'Unable to land due to stormy weather'
      expect { subject.land(plane) }.to raise_error error
    end
  end

  #   As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  describe "Landing a plane when an airport is full at its default capacity" do
    it "should not allow the plane to land and return an error" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      error = "Can't land, airport is full"
      expect { subject.land(plane) }.to raise_error error
    end
  end









end
