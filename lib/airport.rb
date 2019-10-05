require_relative 'plane'
require_relative 'weather'

class Airport
  
  attr_reader :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def land(plane)
    raise "Too stormy to land plane!" if @weather.stormy?
    raise "Hangar is full" if full?
    if plane.in_air == true
      plane.landed
      return @hangar << plane
    else
      raise "Plane is already landed"
    end
  end

  def takeoff(plane)
    raise "Too stormy to takeoff!" if @weather.stormy?
    raise "No planes in hangar" if empty?
    if plane.in_air == false
      plane.flying
      return @hangar.delete(plane)
    else
      raise "Plane is already flying"
    end
  end
  
  private
  
  attr_reader :hangar#, :weather

  def full?
    @hangar.length >= capacity
  end

  def empty?
    @hangar.empty?
  end

end