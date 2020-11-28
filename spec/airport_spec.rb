require 'airport'

describe Airport do
  describe 'full?' do
    it "checks if airport is full" do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      expect(airport.full?).to eq true
    end
  end
end