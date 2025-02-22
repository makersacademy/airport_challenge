require_relative "plane"
 
class Airport
  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather
  DEFAULT_CAPACITY = 10
    
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Landing Declined: Airport full" if @planes.length == capacity

    @planes.push(plane)
  end

  def take_off(plane)
    raise "Weather is stormy" if weather == "stormy"
    @planes.delete(plane)
    @planes
  end

  def return_planes
    @planes
  end

  def weather
    if rand(10) == 1 || rand(10) == 2
      @weather = "stormy"
    else
      @weather = "sunny"
    end
    @weather
  end
end
