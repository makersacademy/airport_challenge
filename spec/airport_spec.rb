require "Airport"

describe Airport do
  
  describe "#initialize" do
    it "checks the set capacity of the hangar" do
      air = Airport.new("Heathrow")
      # expect(Airport.instance_variable_get(:@hangar)).to equal(3)
      expect(air.status.length).to eq(0)
    end

    # before { Airport.instance_variable_set(:@hangar, 3) }
    it "checks if you can change the capacity of the hangar" do
      airport = Airport.new("Heathrow", Array.new(3))
      expect(airport.status.length).to equal(3)
    end
    
  end

  describe "#space?" do
    it "tells how much space there is" do
      airport = Airport.new("Heathrow")

      expect(airport.space?).to eq([])
    end
  end

  describe "#add_plane" do 
    it "adds plane to hangar" do
      airport = Airport.new("Heathrow")
      expect(airport.add_plane("plane 1")).to eq ["plane 1"]

    end
  end

  describe "#status" do
    it "diplays content of hangar" do
      airport = Airport.new("Heathrow")
      airport.add_plane("plane 1")
      expect(airport.status).to eq ["plane 1"]
    end
  end

  describe "#remove_plane" do
    it 'removes plane from hangar' do
      airport = Airport.new("Heathrow")
      airport.add_plane("plane 2") 
      airport.remove_plane("plane 2")
      expect(airport.remove_plane("plane 2")).to eq []
    end
  end

end
