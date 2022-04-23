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

end