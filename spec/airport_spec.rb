require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }

  describe '#land_at_airport' do
    it "instructs planes to land at an airport" do
      expect(airport.land_at_airport(plane)).to eq true
    end

    it "shows the landed plane" do
      airport.land_at_airport(plane)
      expect(airport.plane).to eq plane
      expect(plane).to be_landed
    end

    it "should not let the same plane land twice" do
      airport.land_at_airport(plane)
      expect { airport.land_at_airport(plane) }.to raise_error "Plane already landed!"
    end

    it "should allow up to 20 planes to land" do
      20.times { airport.land_at_airport(Plane.new) }
      expect { airport.land_at_airport(Plane.new) }.to raise_error "Airport full!"
    end
  end

end
