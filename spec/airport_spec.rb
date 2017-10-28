require "airport"

describe Airport do

  let(:airport) { Airport.new }

  describe "initialize airport" do

    it "allows an airport to exist" do
      expect(Airport.new).to be_an_instance_of(Airport)
    end

    it "allows an airport to take an argument once it is initiated" do
      expect(Airport).to respond_to(:new).with(1).argument
    end

  end

  describe "land" do

    it "allows landing at an airport" do
      expect(airport).to respond_to(:land)
    end

    it "allows landing to have an argument" do
      expect(airport).to respond_to(:land).with(1).argument
    end

  end

  describe "take-off" do

    it "allows for a plane to take-off from airport" do
      expect(airport).to respond_to(:take_off)
    end

    it "allows for take-off to have an argument" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

  end

  it "ensures airport stores planes when they land" do
    plane = Plane.new
    airport.land(plane)
    expect(airport.show_planes).to include(plane)
  end

end
