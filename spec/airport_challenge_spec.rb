require "Airport"

describe Airport do
  
  describe '#land' do
    it "accepts 1 argument" do
      airport = Airport.new

      expect(airport).to respond_to(:land).with(1).argument
    end

    it "adds plane to @planes array" do
      airport = Airport.new # arrange
      plane = "plane"

      airport.land(plane) # act

      expect(airport.planes).to eq [plane] #assert
    end

    it "prevents landing when the airport is full" do
      airport = Airport.new
      airport.planes = Array.new(Airport::DEFAULT_CAPACITY, "plane")
      plane = "plane"

      expect{airport.land(plane)}.to raise_error "Airport is full"
    end
  end

  describe '#take_off' do
    it "accepts 1 argument" do
      airport = Airport.new

      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "removes plane from @planes array" do
      airport = Airport.new
      plane = "plane"
      airport.planes = ["plane1", plane, "plane2"]

      airport.take_off(plane)

      expect(airport.planes).to eq ["plane1", "plane2"]
    end
  end

  describe '#full?' do
    it "accepts 0 arguments" do
      airport = Airport.new

      expect(airport).to respond_to(:full?).with(0).arguments
    end

    it "returns true when there are default capacity planes" do
      airport = Airport.new
      airport.planes = Array.new(Airport::DEFAULT_CAPACITY, "plane")

      expect(airport.full?).to eq true
    end

    it "returns false when there are less planes than default capacity" do
      airport = Airport.new
      airport.planes = Array.new(Airport::DEFAULT_CAPACITY - 1, "plane")

      expect(airport.full?).to eq false
    end

    it "returns false when overridden @capacity" do
      airport = Airport.new(100)
      airport.planes = Array.new(99, "plane")

      expect(airport.full?).to eq false
    end
  end
end