require_relative 'plane.rb'

class Airport

MAX_CAPACITY = 10

  attr_reader :plane
  attr_accessor :planes, :capacity

  def initialize(capacity = MAX_CAPACITY)
    @planes = []
    @capacity = MAX_CAPACITY
  end

  def landed_planes
    @planes
  end

  def land(plane)
    fail 'Airport capacity reached "#{MAX_CAPACITY}' if airport_full
    fail 'Plane not flying.' if plane.fly == false

    @planes.append(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def airport_full
    @planes.count >= capacity
  end
end