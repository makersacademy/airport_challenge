require_relative './airplane.rb'
require_relative './weather.rb'

class AirPort
  DEFAULT_CAPACITY = 20
  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end
  attr_reader :planes
  attr_reader :capacity

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def dock(plane)
    return "can only dock planes" unless plane.instance_of?(AirPlane)
    return "airport full, cannot dock" if full?

    @planes << plane
  end

  def take_off(plane)
    index = index_of_plane(plane)
    return "specified plane not in airport" if index == -1
    return "stormy weather, cannot take off" if stormy?

    @planes.delete_at(index)
    plane.goes_in_air
  end

  def index_of_plane(plane)
    for i in 0..@planes.length - 1
      if plane.equal?(@planes[i])
        return i
      end
    end
    return -1
  end

end
