require 'plane_file'

class Airport
  DEFAULT_CAPACITY = 100
  def initialize(capcity = DEFAULT_CAPACITY)
    @planes_at_airport = Array.new
    @capacity = DEFAULT_CAPACITY
  end

  def accept_plane(plane_name)
    @planes_at_airport << plane_name
  end

  def takeoff(plane_name)
    @planes_at_airport.delete(plane_name)
  end

  def landed?(plane_name)
    @planes_at_airport.include?(plane_name)
  end

  def full?
    @planes_at_airport.length >= @capacity
  end
end
