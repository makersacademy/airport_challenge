require_relative 'plane'

class Airport

  DEFAULT_HANGER_CAPACITY = 20

  def initialize(capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @capacity = capacity
    @airport_id = self
  end

  def land(plane)
    return landing_guards(plane, self) if landing_guards(plane, self)
    plane.grounded(self)
    @hanger << plane
  end

  def takeoff(plane)
    return takeoff_guards(plane, self) if takeoff_guards(plane, self)
    @hanger.delete(plane)
    plane.airborn
  end

  private

  def bad_weather?
    # rand(10).zero?
    # true
    false
  end

  def hanger_full?
    @hanger.count == @capacity
    # @hanger.count.zero?
  end

  def takeoff_guards(plane, plane_location)
    return "Cannot takeoff. Plane already airborn" if plane.location == "Airborn"
    return "Plane at wrong airport" if plane_location != @airport_id || plane.location != "The Factory"
    return "The weather is too bad to fly" if bad_weather?
  end

  def landing_guards(plane, plane_location)
    return "Cannot land. Plane already on the ground" if plane.location == plane_location || plane.location == "The Factory"
    return "The weather is too bad to land" if bad_weather?
    return "The plane can't land because the hanger is full" if hanger_full?
  end

end
