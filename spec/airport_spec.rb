require "airport"
require "plane"
require "weather"

describe Airport do

  subject(:airport) {Airport.new}

  describe "#initialize" do
    it "uses default capacity if no capacity given" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "has a weather condition for the day" do
      expect(airport.forecast).to be_a Weather
    end
  end


  context "When weather is sunny" do

    before(:each) {allow(airport).to receive(:stormy?).and_return(false)}

    describe "#land" do
      it "lands a plane" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      it "changes flying attribute to false" do
        plane = Plane.new
        airport.land(plane)
        expect(plane.flying).to eq false
      end

      it "returns error when airport is full" do
        airport.capacity.times {airport.land(Plane.new)}
        plane = Plane.new
        message = "Airport is at maximum capacity!"
        expect{airport.land(plane)}.to raise_exception(message)
      end
    end

    describe "#take_off" do

      it "releases a plane" do
        expect(airport).to respond_to(:take_off)
      end

      it "changes flying attribute to true" do
        plane = Plane.new
        airport.land(plane)
        released_plane = airport.take_off
        expect(released_plane.flying).to eq true
      end

      it "returns error when airport is empty" do
        message = "There are no planes at the airport!"
        expect{airport.take_off}.to raise_exception(message)
      end
    end
  end


  context "When weather is stormy" do

    before(:each) {allow(airport).to receive(:stormy?).and_return(true)}

    describe "#land" do
      it "returns error when trying to land plane in storm" do
        plane = Plane.new
        message = "Weather conditions are unsuitable to land in!"
        expect{airport.land(plane)}.to raise_exception(message)
      end
    end

    describe "#take_off"
      it "returns error when trying to release plane in storm" do
        message = "Weather conditions are unsuitable to take off in!"
        expect{airport.take_off}.to raise_exception(message)
      end
    end
  end
