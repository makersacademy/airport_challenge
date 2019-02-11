require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :airport_name, :capacity
  def initialize(airport, capacity = DEFAULT_CAPACITY)
    @planes = []
    @airport_name = airport
    @capacity = capacity
  end

  def land_plane(plane)
    fail "We can't land as it is stormy" if stormy?

    fail "We can't land as the airport is full" if full?

    plane.location = @airport_name
    @planes << plane
  end

  def takeoff_plane(plane)
    fail "We can't take off as it is stormy" if stormy?

    planes_for_takeoff = @planes.select { plane }
    fail "That plane is not at this airport" if planes_for_takeoff.empty?
    
    plane_for_takeoff = planes_for_takeoff.pop
    @planes.delete(plane_for_takeoff)
    return plane_for_takeoff
  end

private
  def stormy?
    return false unless rand(1..10) <= 8

    true
  end

  def full?
    return false unless @planes.count >= @capacity

    true
  end
end
