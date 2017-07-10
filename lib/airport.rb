require_relative 'plane' #i had to look this up via google
require_relative 'weather'

class Airport
  attr_reader 'planes', 'capacity'
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    @planes = plane

  end

  def landed(plane)
    raise "no more planes." if full?
    @planes << plane

  end

  def takeoff(plane)
    raise "no more planes." if empty?
    @planes.pop

  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY ? true : false

  end

  def empty?
    @planes.empty? ? true : false

  end

end
