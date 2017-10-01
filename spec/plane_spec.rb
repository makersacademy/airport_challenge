require 'plane'
require 'airport'

# class FakeAirport
#   attr_reader :parked_plane, :weather
#
#   def initialize(weather)
#     @weather = weather
#   end
#
#   def parked_plane
#     return nil if @weather == :stormy
#     @parked_plane
#   end
# end

describe Plane do
  airport = Airport.new
  subject(:plane) { described_class.new(airport) }
  # airport.plane = subject
  describe "#land" do
    it 'lands a plane at a sunny airport' do
      expect(plane.land(Airport.new)).to be true
    end

    it 'plane landing at a stormy airport fails' do
      
    end
  end

  describe "#takeoff" do
    it "plane takeoff from a sunny airport succeeds and plane has left" do
      airport = plane.airport
      expect(plane.takeoff).to be true
      expect(airport.plane).to be_nil
    end

    it "plane takeoff from a stormy airport fails and plane remains" do
      airport = plane.airport
      airport.weather = 'stormy'
      airport.plane = plane
      expect { plane.takeoff }.to raise_error 'unable to takeoff due to weather'
      expect(airport.plane).to be_instance_of described_class
    end
  end

end
