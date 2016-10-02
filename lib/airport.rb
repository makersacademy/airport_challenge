require_relative 'plane'

class Airport

attr_reader :plane

attr_accessor :flying, :status, :grounded_planes, :weather

  def initialize
    @weather = weather
    @landed_planes = []
  end

  def land(plane)
    fail 'The weather is stormy, no planes can land' if weather == 'stormy'
    plane.flying = false
    puts "Plane has landed"
    @landed_planes << plane
  end

  def takeoff(plane)
    fail 'The weather is stormy, no planes can take off' if weather == 'stormy'
    @landed_planes.pop
    plane.flying = true
    puts "Plane has taken off"
  end

  def weather
    num = rand(6)
    if num == 0
      weather = 'stormy'
    else
      weather = 'fine'
    end
    weather
  end

end
