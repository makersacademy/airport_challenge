require "airport"
require "plane"

describe Airport do
  it "is an airport where planes land" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "is an airport where planes take off" do
    expect(subject).to respond_to(:lift).with(1).argument
  end
  describe "#land" do
    it "should land a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane's landed!"
    end
  end
  describe "#lift" do
    it "should lift a plane from an airport" do
      plane = Plane.new
      expect(subject.lift(plane)).to eq "Plane took off and has left airport!"
    end
  end
  # it "should not land if airport is full" do
  #   airport = Airport.new
  #   p airport
  #   plane = Plane.new
  #   p plane
  #   airport.full?
  #   p airport.full?
  #   p plane.land
  #   expect(plane.land).to eq "Plane cannot land"
  # end
  # it "should not land if airport is full" do
  #   plane = Plane.new
  #   expect {plane.land}.to raise_error("Airport full! Plane cannot land")
  # end
end
