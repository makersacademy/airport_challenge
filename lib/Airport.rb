require './lib/plane'

class Airport

  attr_accessor :DEFAULT_CAPACITY, :DEFAULT_WEATHER
  attr_reader :plane
  DEFAULT_CAPACITY = 20
  DEFAULT_WEATHER = rand(8)

  def initialize(_capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def depart_plane(_plane)
    if stormy_weather == true
      raise "Takeoff not safe: Stormy weather"
    else
      raise "Plane has left"
    end
  end

  def land_plane(_plane)
    if stormy_weather == true
      raise "Landing not safe: Stormy weather"
    else
      raise "No bays available" if full?
      @parked_planes << plane
    end
  end

  def full?
    true if @parked_planes.count >= DEFAULT_CAPACITY
  end

  def stormy_weather(weather = DEFAULT_WEATHER)
    @weather = DEFAULT_WEATHER
    true if weather > 4
  end  

end 
