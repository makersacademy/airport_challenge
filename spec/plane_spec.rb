require "plane"
require "airport"

describe Plane do
  it "is a plane that can land" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "is a plane that can take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
  describe "#land" do
    it "should land a plane at an airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane's landed!"
    end
  end
  describe "#take_off" do
    it "should lift a plane from an airport" do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq "Plane took off and has left airport!"
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
