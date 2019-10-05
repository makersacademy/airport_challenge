require "airport"

describe Airport do

  let(:airport) { described_class.new }

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  it "has a default capacity" do
    expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it "allows an overriding capacity to be specified upon instantiation" do
    airport_two = described_class.new(100)
    expect(airport_two.capacity).to eq 100
  end

  # Test airport behaviour for various plane landing and take off cases

  context "when a plane lands successfully in sunny weather" do

    it "has the plane" do
      plane = instance_double("Plane")
      allow(plane).to receive(:land).with(airport) { airport.add_plane(plane) }
      airport.sunny
      plane.land(airport)
      expect(airport.planes).to include plane
    end
  end

  context "when a plane landing is prevented due to stormy weather" do

    it "does not have the plane" do
      plane = instance_double("Plane")
      allow(plane).to receive(:land).with(airport) { }
      airport.stormy
      plane.land(airport)
      expect(airport.planes).not_to include plane
    end
  end

  context "when a plane landing is prevented due to airport at full capacity" do

    it "does not have the plane" do
      plane = instance_double("Plane")
      allow(plane).to receive(:land).with(airport) { }
      airport.sunny
      airport.capacity.times { Plane.new.land(airport) }
      plane.land(airport)
      expect(airport.planes).not_to include plane
    end
  end

  context "when a plane takes off successfully in sunny weather" do

    it "no longer has the plane" do
      plane = instance_double("Plane")
      allow(plane).to receive(:land).with(airport) { airport.add_plane(plane) }
      allow(plane).to receive(:take_off).with(airport) { airport.remove_plane(plane) }

      airport.sunny # Create good conditions
      plane.land(airport) # Land the plane so it can take off
      plane.take_off(airport) # Now the plane takes off
      expect(airport.planes).not_to include plane
    end
  end

  context "when a plane is prevented from take off due to stormy weather" do

    it "still has the plane" do
      plane = instance_double("Plane")
      allow(plane).to receive(:land).with(airport) { airport.add_plane(plane) }
      allow(plane).to receive(:take_off).with(airport) { }

      airport.sunny # Create good conditions
      plane.land(airport) # Land the plane so it can take off
      airport.stormy # Now it is stormy
      plane.take_off(airport) # Try taking off (should be unsuccessful)
      expect(airport.planes).to include plane
    end
  end

end
