require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  WEATHER_CUTOFF = 8
  
  def initialize(size = DEFAULT_CAPACITY)
    @hangar = []
    @size = size
    @weather = 1
  end

  attr_reader :plane, :hangar

  def land(plane)
    raise "Cannot land: stormy weather" if stormy?
    raise "Error: Plane already landed" if plane == @plane
    raise "Airport is full" if hangar.length == @size
    hangar << plane
    @plane = plane
  end

  def takeoff(plane)
    raise "Cannot takeoff: stormy weather" if stormy?
    raise "Error: Plane is already in the air." if !hangar.include? plane 
    hangar.delete(plane)
  end

  def check_weather
    if random_number > WEATHER_CUTOFF
      "It is stormy."
    else
      "It is a clear, sunny day."
    end
  end

  private

  attr_reader :weather

  def random_number
    @weather = rand(1..10)
  end

  def stormy?
    weather > WEATHER_CUTOFF
  end

end
