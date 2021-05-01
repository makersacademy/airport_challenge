require_relative 'plane'

class Airport

  attr_reader :landed_planes, :capacity

  def initialize(capacity = 2)
    @capacity = capacity
    @landed_planes = []
  end

  def take_off(plane)
    @plane = plane
    raise "Plane has already taken off" unless @landed_planes.include?(plane)
    if weather == "Stormy"
      return "Weather is stormy; plane is unable to take off"
      else
        @landed_planes.delete(plane)
        "#{plane} has taken off"
    end
  end

  def land(plane)
    @landed_plane = plane
    raise "Plane has already landed at this airport" if @landed_planes.include?(plane)
    raise "Airport full; unable to land plane" if @landed_planes.length == @capacity
    if weather == "Stormy"
      return "Weather is stormy; plane is currently unable to land"
      else
        @landed_planes.push(plane)
        "#{plane} has landed"
    end
  end

  def weather
    if rand() > 0.25
      weather = "Sunny"
    else
      weather = "Stormy"
    end
  end
end
