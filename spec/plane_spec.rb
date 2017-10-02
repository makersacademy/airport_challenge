require 'plane'
require 'airport'

class FakeAirport
  attr_reader :capacity
  attr_accessor :weather

  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
  end
end

describe Plane do
  airport = Airport.new('test')
  subject(:plane) { described_class.new }

  describe "#land" do
    it 'lands a plane at a sunny airport' do
      plane.land(airport)
      expect(plane.status).to be :landed
    end

    it 'plane landing at a stormy airport fails' do
      airport.weather = :stormy
      expect(plane.status).to be :flying
    end

    it 'plane unable to land at full airport' do
      capacity = 10
      airport = Airport.new('test', capacity)

      capacity.times do
        new_plane = Plane.new
        new_plane.land(airport)
      end

      expect { Plane.new.land(airport) }.to raise_error 'no space to land'
    end

  end

  describe "#takeoff" do
    it "plane takeoff from a sunny airport succeeds and plane has left" do
      capacity = 10
      airport = Airport.new('test', capacity)
      airport.weather = :sunny
      plane = Plane.new(airport)
      plane.takeoff
      expect(plane.status).to be :flying
      expect(airport.empty?).to be true
    end

    it "plane takeoff from a stormy airport fails and plane remains" do
      capacity = 10
      airport = Airport.new('test', capacity)
      plane = Plane.new(airport)
      airport.weather = :stormy
      expect { plane.takeoff }.to raise_error 'unable to takeoff due to weather'
      expect(plane.status).to be :landed
    end
  end

end
