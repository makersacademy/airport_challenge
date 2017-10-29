require "plane"

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { double(:airport) }

  describe "initialize plane" do

    it "allows a plane to exist" do
      expect(Plane.new).to be_an_instance_of(Plane)
    end

    it "allows a plane to exist passing one argument, flying status" do
      expect(Plane).to respond_to(:new).with(1).argument
    end

  end

  describe "flying" do

    it "expects a plane to respond to flying method" do
      expect(plane).to respond_to(:flying)
    end

    it "expects flying method to return false to a newly created plane" do
      expect(plane.flying). to eq false
    end

  end

  describe "attempt landing at airport" do

    it "expects a plane to respond to attempt_land method at an airport" do
      expect(plane).to respond_to(:attempt_land).with(1).argument
    end

    it "expects flying to become false once landing has occured" do
      allow(airport).to receive(:land).and_return(true)
      plane_flying = Plane.new(true)
      plane_flying.attempt_land(airport)
      expect(plane_flying.flying).to eq false
    end

  end

  describe "attempt taking-off from airport" do

    it "expects a plane to respond to attempt_take_off method at an airport" do
      expect(plane).to respond_to(:attempt_take_off).with(1).argument
    end

    it "expects flying to become true once taking-off has occured" do
      allow(airport).to receive(:take_off).and_return(true)
      plane.attempt_take_off(airport)
      expect(plane.flying).to eq true
    end

  end

end
