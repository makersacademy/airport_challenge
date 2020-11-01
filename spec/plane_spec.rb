require 'plane'

describe Plane do
  let(:good_weather_empty_airport) { double :airport, :capacity => 50, :planes => [], :current_weather => 'chill' }
  let(:good_weather_full_airport) { double :airport, :capacity => 2, :planes => [Plane.new, Plane.new], :current_weather => 'chill' }
  let(:bad_weather_empty_airport) { double :airport, :capacity => 50, :planes => [], :current_weather => 'stormy' }
  let(:flying_plane) { Plane.new(true) }
  let(:grounded_plane) { Plane.new(false) }

  it "is created with a random call sign" do
    call_signs = []
    1000.times do
      plane = Plane.new
      call_signs << plane.call_sign
    end
    expect(call_signs.length).to eq(call_signs.uniq.length)
  end

  describe "#land" do
    it "can land in an empty airport" do
      flying_plane.land(good_weather_empty_airport)
      expect(good_weather_empty_airport.planes).to include(flying_plane)
    end

    it "cannot land at a full airport" do
      expect { flying_plane.land(good_weather_full_airport) }.to raise_error("Airport is full!")
    end

    it "cannot land if landed" do
      expect { grounded_plane.land(good_weather_empty_airport) }.to raise_error("Plane is already on the ground!")
    end

    it "is no longer airborne after landing" do
      flying_plane.land(good_weather_empty_airport)
      expect(flying_plane.airbourne).to eq(false)
    end

    it "can't land in a storm" do
      expect { flying_plane.land(bad_weather_empty_airport) }.to raise_error("Stormy conditions are preventing a landing.")
    end
  end

  describe "#take_off" do
    it "is airbourne after taking off" do
      flying_plane.land(good_weather_empty_airport)
      flying_plane.take_off(good_weather_empty_airport)
      expect(flying_plane.airbourne).to eq(true)
    end

    it "cannot take off from an airport it isn't in" do
      expect { grounded_plane.take_off(good_weather_empty_airport) }.to raise_error("Plane can't take off from an airport it's not in!")
    end

    it "cannot take off under stormy conditions" do
      plane = Plane.new
      airport = double :airport, :capacity => 50, :planes => [plane], :current_weather => 'stormy'
      expect { plane.take_off(airport) }.to raise_error("Too stormy for a takeoff.")
    end

    it "removes plane from an airports array of planes after taking off" do
      alpha = Plane.new
      bravo = Plane.new
      airport = double :airport, :capacity => 50, :planes => [alpha, bravo], :current_weather => 'chill'
      bravo.take_off(airport)
      expect(airport.planes).not_to include(bravo)
      expect(airport.planes).to include(alpha)
    end
  end
end