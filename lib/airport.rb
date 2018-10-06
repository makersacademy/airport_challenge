require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY, planes = [])
    @planes = planes
    @capacity = capacity
  end

  attr_reader :planes, :capacity

  def random_generator
    rand(1..5)
  end

  def check_storm?
    random_generator == 5
  end

  def error_if_storm
    raise 'Cannot land or take off in storm' if check_storm?
  end

  def error_if_at_capacity
    raise 'Airport at capacity' if @planes.length >= @capacity
  end

  def error_plane_not_in_airport(plane)
    raise 'Plane not in airport' unless @planes.include?(plane)
  end

  def error_if_plane_not_flying(plane)
    raise 'Plane not in flight' unless plane.location == :in_flight
  end

  def land(plane)
    error_if_storm
    error_if_at_capacity
    error_if_plane_not_flying(plane)
    @planes << plane
    plane.location = self
  end

  def take_off(plane)
    error_plane_not_in_airport(plane)
    error_if_storm
    @planes.delete(plane)
    plane.location = :in_flight
  end

end
