require 'airport'
require 'plane'

describe Airport do

  describe "#land" do
    it "lands the planes when sunny" do
      plane = Plane.new
      airport = Airport.new
      expect(airport).to receive(:tell_weather).and_return("sunny")
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe "#land" do
    airport = Airport.new
    plane = Plane.new
    it "prevent from landing when stormy" do
      expect(airport).to receive(:tell_weather).and_return("stormy")
      expect(airport.land(plane)).to eq nil
    end
  end

  describe "raising error when full" do
    airport = Airport.new
    plane = Plane.new
    it 'raises error when full' do
      airport.capacity.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'No free spots avaialble'
    end
  end

  describe "#take_off" do
    it "take off the planes when sunny" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport).to receive(:tell_weather).and_return("sunny")
      airport.take_off(plane)
      expect(airport.planes_a).to eq []
    end
  end

  describe "#take_off" do
    it "prevent from taking off the planes when stormy" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport).to receive(:tell_weather).and_return("stormy")
      airport.take_off(plane)
      expect(airport.planes_a).to eq [plane]
    end
  end

  describe "#confirm_take_off" do
    it "confirms that the plane took off" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport).to receive(:tell_weather).and_return("sunny")
      airport.take_off(plane)
      expect(airport.confirm_take_off(plane)).to eq "#{plane} took off"
    end
  end

  describe "#confirm_take_off" do
    it "says plane didnt take off" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport).to receive(:tell_weather).and_return("stormy")
      airport.take_off(plane)
      expect(airport.confirm_take_off(plane)).to eq "#{plane} didn't take off"
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
