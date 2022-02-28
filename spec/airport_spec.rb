require 'airport'
require_relative '../lib/airplane'
require_relative '../lib/air_traffic_controller'

describe Airport do
  context "the tests for airport functionality" do
    it "Allows the airport capacity to be overridden" do
      test_airport = Airport.new(2)
      expect(test_airport.capacity).to eq(2)
    end
  end
end
