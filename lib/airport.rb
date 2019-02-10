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
    plane_for_takeoff = planes_for_takeoff.pop
    @planes.delete(plane_for_takeoff)
    return plane_for_takeoff
  end

private
  def stormy?
    weather = rand(1..2)
    if weather == 1
      true
    else
      false
    end
  end

  def full?
    if @planes.count >= @capacity
      true
    else
      false
    end
  end
end
