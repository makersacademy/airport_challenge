require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }

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

  describe '#take_off' do
    it "instructs a plane to take off from the airport" do
      airport.land_at_airport(plane)
      airport.take_off(plane)
      expect(plane.landed?).to be false
    end

    it 'removes plane after take off' do
      airport.land_at_airport(plane)
      expect(airport.take_off(plane)).to_not eq plane
    end

    it "should not let the same plane take off twice" do
      airport.land_at_airport(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane already gone!"
    end

    it "doesn't allow a plane to take off if weather is stormy" do
      airport.land_at_airport(plane)
      airport.weather.incoming_storm
      expect { airport.take_off(plane) }.to raise_error "Stormy weather abort take off!"
    end
  end

end
