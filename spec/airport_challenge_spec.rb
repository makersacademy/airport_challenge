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
      allow(airport).to receive(:stormy?).and_return(false)

      airport.land(plane) # act

      expect(airport.planes).to eq [plane] #assert
      expect{airport.land(plane)}.not_to raise_error
    end

    it "prevents landing when the airport is full" do
      airport = Airport.new
      airport.planes = Array.new(Airport::DEFAULT_CAPACITY, "plane")
      plane = "plane"

      expect{airport.land(plane)}.to raise_error "Airport is full."
    end

    it "prevents landing when the weather is stormy" do
      airport = Airport.new
      plane = "plane"
      allow(airport).to receive(:stormy?).and_return(true)

      expect{airport.land(plane)}.to raise_error "Weather is stormy. You can't land the plane."
    end

    it "plane lands when the weather is sunny" do
      airport = Airport.new
      plane = "plane"
      allow(airport).to receive(:stormy?).and_return(false)

      expect{airport.land(plane)}.not_to raise_error
    end
  end

  describe '#take_off' do
    it "accepts 1 argument" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(true)
      plane = "plane"

      expect(airport).to respond_to(:take_off).with(1).argument
      expect{airport.take_off(plane)}.to raise_error "Weather is stormy. You can't take off the plane."
    end

    it "removes plane from @planes array" do
      airport = Airport.new
      plane = "plane"
      airport.planes = ["plane1", plane, "plane2"]
      allow(airport).to receive(:stormy?).and_return(false)
      airport.take_off(plane)

      expect(airport.planes).to eq ["plane1", "plane2"]
      expect{airport.take_off(plane)}.not_to raise_error
    end

    it "prevents take off when the weather is stormy" do
      airport = Airport.new
      plane = "plane"
      allow(airport).to receive(:stormy?).and_return(true)

      expect{airport.take_off(plane)}.to raise_error "Weather is stormy. You can't take off the plane."
    end

     it "plane takes off when the weather is sunny" do
      airport = Airport.new
      plane = "plane"
      allow(airport).to receive(:stormy?).and_return(false)

      expect{airport.take_off(plane)}.not_to raise_error
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

  describe '#stormy?' do
    it "accepts 0 argument" do
      airport = Airport.new

      expect(airport).to respond_to(:stormy?).with(0).argument
    end

    it "returns true when the weather is stormy" do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(0)
      expect(airport.stormy?).to eq true
    end

    it "returns false when the weather is sunny" do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(3)
      expect(airport.stormy?).to eq false
    end
  end
end