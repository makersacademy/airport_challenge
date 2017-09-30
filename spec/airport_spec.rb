require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  describe '#land_at_airport' do
    it "instructs planes to land at an airport" do
      plane = Plane.new
      expect(airport.land_at_airport(plane)).to eq plane
    end
  end

  describe '#plane' do
    it "shows the landed plane" do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect(airport.plane).to eq plane
      expect(plane).to be_landed
    end
  end

end
