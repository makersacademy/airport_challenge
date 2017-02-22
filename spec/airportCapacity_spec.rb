require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  before do
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
  end

  describe "#capacity", :capacity_tests do
    it "prevents planes from landing when airport is full" do
      Airport::DEFAULT_CAPACITY.times{airport.instruct_to_land(Plane.new)}
      message = "Landing not permitted as max capacity has been reached."
      expect{airport.instruct_to_land(plane)}.to raise_error message
    end

    it "sets the capacity of the airport to a given value" do
      bigger_airport = Airport.new(50)
      expect(bigger_airport.capacity).to eq(50)
    end

    it "allows default capacity to be overridden" do
      bigger_airport = Airport.new(50)
      49.times{bigger_airport.instruct_to_land(Plane.new)}
      expect(bigger_airport.instruct_to_land(Plane.new)).to eq bigger_airport
      # SHOULD I ACTUALLY TEST FOR LENGTH OF PLANE ARRAY?
    end
  end
end
