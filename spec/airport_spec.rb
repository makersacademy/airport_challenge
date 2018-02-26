require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
  let(:airport_not_full) { Airport.new("not full", 10) }
  let(:airport_full) { Airport.new("full", 10) }
  let(:plane) { Plane.new }
  let(:plane_dbl) { double(:plane_dbl) }

  describe "allows passengers to get to their destination" do
    it "by landing a plane at an airport" do
      allow(airport_not_full).to receive(:check_weather) { "sunny" }
      allow(plane_dbl).to receive(:plane_status) { "airborne" }
      allow(plane_dbl).to receive(:landed) { "landed" }

      sunny = airport_not_full.check_weather
      ramp = airport_not_full.land_plane(plane_dbl, 0, sunny)
      expect(ramp).to include(plane_dbl)
    end

    it "by taking off a plane from an airport and confirming so" do
      allow(airport_not_full).to receive(:check_weather) { "sunny" }
      allow(plane_dbl).to receive(:plane_status) { "landed" }
      allow(plane_dbl).to receive(:airborne) { "airborne" }

      sunny = airport_not_full.check_weather
      airport_full.ramps.insert(0, plane_dbl)
      expect(airport_full.take_off(0, sunny)).to eq plane_dbl
      expect { airport_full.take_off(11, sunny) }.to raise_error "No plane at this ramp"
    end
  end

  describe "to ensure safety" do
    it "can check the weather" do
      expect { airport_full.check_weather }.to(change { airport_full.weather_report })
    end

    it "prevents landing when stormy" do
      allow(airport_not_full).to receive(:check_weather) { "stormy" }
      expect {
        stormy = airport_not_full.check_weather
        airport_not_full.land_plane(plane, 0, stormy)
      }.to raise_error "Weather is stormy - cannot land"
    end

    it "prevents take-off when stormy" do
      allow(airport_not_full).to receive(:check_weather) { "stormy" }
      expect {
        stormy = airport_not_full.check_weather
        airport_full.take_off(0, stormy)
      }.to raise_error "Weather is stormy - cannot take-off"
    end

    it "prevents landing when airport is full" do
      allow(airport_not_full).to receive(:check_weather) { "sunny" }
      sunny = airport_not_full.check_weather
      this_plane = Plane.new
      expect { airport_full.land_plane(this_plane, 0, sunny) }.to raise_error "Airport is full - cannot land"
    end
  end

  describe "to allow for use at different airports" do
    it "allows the default airport capacity to be overridden" do
      other_airport = Airport.new("full", 20)
      expect(airport_full.airport_capacity).to eq(CAPACITY::AIR_CAP)
      expect(other_airport.airport_capacity).not_to eq(CAPACITY::AIR_CAP)
    end
  end

end
