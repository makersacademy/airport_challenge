require  "airport"
require  "plane"
require "weather"

describe Airport do
  subject (:airport) {described_class.new()}
  let (:plane) {double :plane, landed: nil, has_landed: true, has_landed?: false }
  let (:weather) {double :weather}
  let (:plane2) {double :plane}

  describe "when landing a plane it" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
      # allow(plane).to receive(:landed=) {false}
    end
    it "should confirm if the plane has landed" do
      expect(airport.land(plane)).to eq "The plane #{plane} has landed"
    end
    it "should keep track of the planes that landed" do
      airport.land(plane)
      expect(airport.planes.count).to be 1
    end
  end
  describe "when a plane takes off" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed=) {true}
    end

    it "should delete the plane from the list" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes.count).to eq 0
    end
    it "should confirm the plane has taken off" do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "The plane #{plane} has taken off"
    end
  end
  describe "when weather is stormy" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return true
    end
    it "should not let a plane land" do
      allow(airport).to receive(:stormy?).and_return true
      expect{airport.land(plane)}.to raise_error("The plane can't land when the weather is stormy")
    end
    it "should not let a plane take off" do
      expect{airport.take_off(plane)}.to raise_error("The plane can't take off when the weather is stormy")
    end
  end
  describe "when airport is full" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
    end
    it "should not let a plane land" do
      20.times {airport.land(Plane.new)}
      expect{airport.land(plane2)}.to raise_error "Cannot land plane if airport is full"
    end
  end
  describe "when capacity" do
    weather1 = Weather.new
    airport1 = Airport.new(5,weather1)
    it "should have a default value of 20" do
      expect(airport.capacity).to eq 20
    end
    it "should allow for a custom value to be set" do
      expect(airport1.capacity).to eq 5
    end
  end
  describe "when trying to land a plane multiple times" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed=) {false}
    end
    it "raises and error" do
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error "Plane is already landed"
    end
  end
  describe "when trying to take_off the same plane multiple times" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed=) {false}
    end
    it "raises an error" do
      airport.land(plane)
      airport.take_off(plane)
      expect{airport.take_off(plane)}.to raise_error "The plane has already taken off"
    end
  end

  describe "when same plane and different airports" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
    end
    it "should not be able to land at an airport if its already landed at another airport" do
      plane_1 = Plane.new
      airport.land(plane_1)
      airport_2 = Airport.new
      allow(airport_2).to receive(:stormy?).and_return false
      expect{airport_2.land(plane_1)}.to raise_error 'The plane has already landed at an airport.'
    end
  end
end
