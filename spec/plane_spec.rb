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
  end
end