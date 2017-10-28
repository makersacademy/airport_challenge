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

    it "ensures that a landed plane gets stored at airport" do
      plane = double(:plane)
      airport.land(plane)
      expect(airport.planes).to include(plane)
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

  describe "planes" do

    it "ensures airport shows 20 planes that landed" do
      plane = double(:plane)
      20.times {airport.land(plane)}
      p "HERE", airport.planes.count
      expect(airport.planes.count).to eq(20)
    end

  end

end
