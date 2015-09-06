require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    #@planes << Plane.new("landed")
  end

  def clear_to_land(plane)
    if @planes.count >= @capacity
    raise 'Airport at Capacity'
    else
    plane.land
    @planes << plane
    end
  end


    def clear_to_take_off(plane)
    plane = @planes.pop
    plane.take_off
    end

  def planes
    @planes
  end

  def count_planes
   @planes.count
  end

end
