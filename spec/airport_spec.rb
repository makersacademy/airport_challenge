require "airport"

describe Airport do

  describe "#initialize" do
    it "Creates airports with default capacity of 20" do
      heathrow = Airport.new("Heathrow")
      expect(heathrow.capacity).to eq 20
    end
    it "Creates airports with any given capacity" do
      gatwick = Airport.new("Gatwick", 10)
      expect(gatwick.capacity).to eq 10
    end
  end

end
