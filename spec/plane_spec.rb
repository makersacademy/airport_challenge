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
  end
end