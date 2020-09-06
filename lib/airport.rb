require 'plane'
class Airport
  attr_accessor :parked_planes, :capacity, :local_weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity
    @local_weather = set_weather
  end

  def land_plane(flight_number = Plane.new)
    raise "airport is full" if @parked_planes.length >= @capacity
    raise "weather conditions too poor" if @local_weather == "stormy"
    @parked_planes << flight_number
  end

  def take_off
    fail "weather conditions too poor" unless @local_weather == "sunny"
    @parked_planes.pop 
  end

  def set_weather
     random_number = rand(10)
     random_number < 8 ? "sunny" : "stormy"
  end
end
