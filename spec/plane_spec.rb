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
      plane = Plane.new
      plane.land(empty_airport)
      expect(empty_airport.planes).to include(plane)
    end

    it "cannot land at a full airport" do
      full_airport = Airport.new(1)
      Plane.new.land(full_airport)
      expect { Plane.new.land(full_airport) }.to raise_error("Airport is full!")
    end

    it "cannot land if landed" do
      alpha = Plane.new
      airport = Airport.new(50, [alpha])
      expect { alpha.land(airport) }.to raise_error("Plane is already on the ground!")
    end
  end

  describe "#take_off" do
    it "is removed from the array of planes after taking off" do
      alpha = Plane.new
      bravo = Plane.new
      airport = Airport.new(50, [alpha, bravo])
      bravo.take_off
      expect(airport.planes).not_to include(bravo)
      expect(airport.planes).to include(alpha)
    end
  end
end