require "airport"
require "plane"
require "weather"

describe Airport do

  context "When weather is sunny"

    describe "#land" do
      subject(:airport) {Airport.new} #give new instance name airport
      it "lands a plane" do
        expect(airport).to respond_to(:land).with(1).argument
      end
      it "changes flying attribute to false" do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        airport.land(plane)
        expect(plane.flying).to eq false
      end
      it "returns error when airport is full" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.capacity.times {subject.land(Plane.new)}
        plane = Plane.new
        message = "Airport is at maximum capacity!"
        expect{subject.land(plane)}.to raise_exception(message)
      end
    end

    describe "#take_off" do
      it "releases a plane" do
        expect(subject).to respond_to(:take_off)
      end
      it "changes flying attribute to true" do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land(plane)
        released_plane = subject.take_off
        expect(released_plane.flying).to eq true
      end
      it "returns error when airport is empty" do
        allow(subject).to receive(:stormy?).and_return(false)
        message = "There are no planes at the airport!"
        expect{subject.take_off}.to raise_exception(message)
      end
    end

  context "When weather is stormy"

    describe "#land" do
      it "returns error when trying to land plane in storm" do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(true)
        message = "Weather conditions are unsuitable to land in!"
        expect{subject.land(plane)}.to raise_exception(message)
      end

    describe "#take_off"
      it "returns error when trying to release plane in storm" do
        allow(subject).to receive(:stormy?).and_return(true)
        message = "Weather conditions are unsuitable to take off in!"
        expect{subject.take_off}.to raise_exception(message)
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
