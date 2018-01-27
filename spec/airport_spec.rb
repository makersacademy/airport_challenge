require 'airport'
require 'plane'

describe Airport do

  describe "#land" do
    it "lands the planes" do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it "take off the planes" do
      plane = Plane.new
      airport = Airport.new
      expect(airport.take_off(plane)).to eq nil
    end
  end

  describe "#confirm_take_off" do
    it "confirms that the plane took off" do
      plane = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      expect(airport.confirm_take_off(plane)).to eq "#{plane} took off"
      expect(airport.confirm_take_off(plane2)).to eq "#{plane2} didn't take off"
    end
  end

  describe "#random" do
    it "returns a number from 0 to 6" do
      airport = Airport.new
      expect(airport).to receive(:random).and_return(1)
      expect(airport.random).to eq 1
    end
  end

  describe "#tell_weather" do
    it "says it's stormy" do
      airport = Airport.new
      expect(airport).to receive(:random).and_return(1)
      expect(airport.tell_weather).to eq "stormy"
    end
  end

  describe "#tell_wheather" do
    it "says it's sunny" do
      airport = Airport.new
      expect(airport).to receive(:random).and_return(5)
      expect(airport.tell_weather).to eq "sunny"
    end
  end

end
