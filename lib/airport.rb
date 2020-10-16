require './lib/plane.rb'
require './lib/weather.rb'
class Airport

  attr_reader :planes, :CAPACITY, :weather
  def initialize(capacity = 20)
    @planes = []
    @takenoffplanes = []
    @CAPACITY = capacity
    @weather = Weather.new
  end

  def land(plane)
    if full?
      raise "Hanger full, connot land"
    elsif possible?(plane, @planes)
      if !(full?) and !(@weather.stormy)
        @planes << plane
        return "#{plane} has landed"
      else
        raise "Weather is stormy cannot land"
      end
    else
      raise "Plane already landed"
    end
  end

  def takeoff(plane)
    if possible?(plane, @takenoffplanes)
      if !(@weather.stormy)
        @planes.delete_at(@planes.index(plane))
        @takenoffplanes << plane
        return "#{plane}, has taken off"
      else
        raise "Weather is stormy cannot takeoff"
      end
    else
      raise "Plane already taken off"
    end
  end

  private
  def full?
    if @planes.length >= @CAPACITY
      return true
    else
      return false
    end
  end

  def possible?(plane, planes)
    if planes.include?(plane) == false
      return true
    else
      return false
    end
  end
end
