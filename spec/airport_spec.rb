require "airport"
require "plane"

describe Airport do

  describe "#land" do
    subject(:airport) {Airport.new} #give new instance name airport
    it "lands a plane" do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it "changes flying attribute to false" do
      plane = Plane.new
      airport.land(plane)
      expect(plane.flying).to eq false
    end
  end

  describe "#take_off" do
    it "releases a plane" do
      expect(subject).to respond_to(:take_off)
    end
    it "changes flying attribute to true" do
      plane = Plane.new
      subject.land(plane)
      released_plane = subject.take_off
      expect(released_plane.flying).to eq true
    end
  end

  describe "#initialize" do
    it "uses default capacity if no capacity given" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "has a weather condition for the day" do
      expect(subject.forecast).to be_a Weather
    end
  end
end
