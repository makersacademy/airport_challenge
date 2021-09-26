require_relative "../lib/airport"

RSpec.describe Airport do
  describe ".init" do
    it "creates and airport with custom capacity" do
      capacity = 9
      airport = Airport.new(capacity)
      capacity.times do
        airport.land(Plane.new)
      end
      expect{ airport.land(Plane.new) }.to raise_error "Cannot land, airport is full"
    end
  end

  describe ".land" do
    it "lands the plane at the not full airport" do 
      plane = Plane.new()
      airport = Airport.new()
      airport.land(plane)
      expect(airport.planes_at_airport.count).to eq 1
      expect(airport.planes_at_airport[0]).to eq plane
    end
    
    it "raises an error when landing planes in a full airport" do
      airport = Airport.new
      airport.plane_capacity.times do
        airport.land(Plane.new)
      end
      expect{ airport.land(Plane.new) }.to raise_error "Cannot land, airport is full"
    end
  end
end




