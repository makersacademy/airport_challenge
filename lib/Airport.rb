require './lib/plane.rb'

class Airport

attr_accessor :DEFAULT_CAPACITY, :DEFAULT_WEATHER,
attr_reader :plane
DEFAULT_CAPACITY = 20
DEFAULT_WEATHER = rand(8)

  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def depart_plane(plane)
    if stormy_weather == true
    raise "Takeoff not safe: Stormy weather"
    else
    raise "Plane has left"
    end
  end

  def land_plane(plane)
    if stormy_weather == true
      raise "Landing not safe: Stormy weather"
    else
    raise "No bays available" if full?
    @parked_planes << plane
    end
  end

  def full?
    if @parked_planes.count >= DEFAULT_CAPACITY
      return true
    end
  end

  def stormy_weather(weather = DEFAULT_WEATHER)
    @weather = DEFAULT_WEATHER
    if weather > 4
    true
    end
  end  

end 