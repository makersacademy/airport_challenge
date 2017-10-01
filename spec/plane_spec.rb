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

  describe "#land" do
    it 'lands a plane at a sunny airport' do
      expect(plane.land(airport)).to be true
    end

    it 'plane landing at a stormy airport fails' do
      airport = plane.airport
      airport.plane = plane
      airport.weather = :stormy
    end

    it 'plane unable to land at full airport' do
      capacity = 10
      airport = Airport.new(capacity)

      capacity.times do
        new_plane = Plane.new
        new_plane.land(airport)
      end

      new_plane =
      expect{ (Plane.new).land(airport) }.to raise_error 'no space to land'
    end

  end

  describe "#takeoff" do
    it "plane takeoff from a sunny airport succeeds and plane has left" do
      capacity = 10
      airport = Airport.new(capacity)
      airport.weather = :sunny
      expect(plane.takeoff).to be true
      expect(airport.empty?).to be true
    end

    it "plane takeoff from a stormy airport fails and plane remains" do
      airport = plane.airport
      airport.weather = :stormy
      airport.plane = plane
      expect { plane.takeoff }.to raise_error 'unable to takeoff due to weather'
      expect(airport.plane).to be_instance_of described_class
    end
  end

end
