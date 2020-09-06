require 'plane'
class Airport
  attr_accessor :parked_planes, :capacity, :local_weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity
    @local_weather = set_weather
  end

  def land_plane(*plane)
    raise "airport is full" if @parked_planes.length >= @capacity

    raise "weather conditions too poor" if weather_is_bad

    if plane.length < 1
      @parked_planes << Plane.new
    else 
      plane[0].landed = true
      @parked_planes << plane[0]
    end
  end

  def take_off(*plane)
    fail "weather conditions too poor" if weather_is_bad

    if plane.length.zero?
      @parked_planes.pop 
    else
      fail "plane is already flying..." if plane[0].landed == false

      @parked_planes.delete(plane[0])
      plane = plane.pop
      plane.landed = false
      plane
    end
  end

  def set_weather
    random_number = rand(10)
    random_number < 8 ? "sunny" : "stormy"
  end

  def weather_is_bad
    false if @local_weather == "sunny"
    true if @local_weather == "stormy"
  end
end
