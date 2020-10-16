require './lib/plane.rb'
require './lib/weather.rb'
class Airport

  attr_reader :planes, :capacity, :weather
  def initialize(capacity = 20)
    @planes = []
    @takenoffplanes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Hanger full, connot land" if full?

    raise "Weather is stormy cannot land" unless !full? && !@weather.stormy

    raise "Plane already landed" unless possible?(plane, @planes) && !full?

    @planes << plane
    return "#{plane}, has has landed"
  end

  def takeoff(plane)
    raise "Plane already taken off" unless possible?(plane, @takenoffplanes)

    raise "Weather is stormy cannot takeoff" if @weather.stormy

    @planes.delete_at(@planes.index(plane))
    @takenoffplanes << plane
    return "#{plane}, has taken off"

  end

  private
  def full?
    return true if @planes.length >= @capacity

    return false
  end

  def possible?(plane, planes)
    return true unless planes.include?(plane)

    return false
  end
end
