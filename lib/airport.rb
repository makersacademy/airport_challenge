require_relative 'plane'

class Airport

attr_reader :plane
attr_accessor :flying, :status, :grounded_planes, :weather, :capacity

DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = weather
    @landed_planes = []
  end

  def land(plane)
    fail 'Plane can not land as airport is full' if full?
    fail 'Plane can not land as the weather is to stormy' if weather == 'stormy'
    plane.flying = false
    puts "Plane has landed"
    @landed_planes << plane
  end

  def takeoff(plane)
    fail 'The weather is stormy, no planes can take off' if weather == 'stormy'
    fail 'The plane is not at this airport!' unless @landed_planes.include?(plane)
    @landed_planes.pop
    plane.flying = true
    puts "Plane has taken off"
  end

  def weather
    weather = rand(6)
    weather == 0 ? 'stormy' : 'fine'
  end

private

attr_reader :landed_planes

  def full?
    @landed_planes.count >= capacity
  end

end
