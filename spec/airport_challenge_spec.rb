require "Airport"

describe Airport do
  
  describe '#land' do
    it "accepts 1 argument" do
      airport = Airport.new
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "adds plane to @planes array" do
      airport = Airport.new
      plane = "plane"
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end



end