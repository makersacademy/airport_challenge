require 'plane'
require 'airport'

describe Plane do
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
      empty_airport = Airport.new
      plane = Plane.new(true)
      plane.land(empty_airport)
      expect(empty_airport.planes).to include(plane)
    end

    it "cannot land at a full airport" do
      full_airport = Airport.new(1)
      airbourne_plane = Plane.new(true)
      airbourne_plane.land(full_airport)
      second_airbourne_plane = Plane.new(true)
      expect { second_airbourne_plane.land(full_airport) }.to raise_error("Airport is full!")
    end

    it "cannot land if landed" do
      alpha = Plane.new
      airport = Airport.new(50, [alpha])
      expect { alpha.land(airport) }.to raise_error("Plane is already on the ground!")
    end

    it "is no longer airborne after landing" do
      freshly_landed = Plane.new(true)
      freshly_landed.land(Airport.new)
      expect(freshly_landed.airbourne).to eq(false)
    end

    it "can't land in a storm" do
      alpha = Plane.new(true)
      airport = Airport.new
      allow(airport).to receive(:current_weather).and_return('stormy')
      expect { alpha.land(airport) }.to raise_error("Stormy conditions are preventing a landing.")
    end
  end

  describe "#take_off" do
    it "is removed from the array of planes after taking off" do
      alpha = Plane.new
      bravo = Plane.new
      airport = Airport.new(50, [alpha, bravo])
      bravo.take_off(airport)
      expect(airport.planes).not_to include(bravo)
      expect(airport.planes).to include(alpha)
    end

    it "is airbourne after taking off" do
      about_to_fly = Plane.new
      airport = Airport.new(50, [about_to_fly])
      about_to_fly.take_off(airport)
      expect(about_to_fly.airbourne).to eq(true)
    end

    it "cannot take off from an airport it isn't in" do
      plane_at_berlin = Plane.new
      london = Airport.new
      expect { plane_at_berlin.take_off(london) }.to raise_error("Plane can't take off from an airport it's not in!")
    end
  end
end