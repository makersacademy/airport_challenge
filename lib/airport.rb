require_relative 'plane'

class Airport

  DEFAULT_HANGER_CAPACITY = 20

  def initialize(capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    return "The weather is too bad to land" if bad_weather?
    return "The plane can't land because the hanger is full" if hanger_full?
    plane.grounded(self)
    @hanger << plane
  end

  def takeoff(plane)
    return "Cannot takeoff. Plane already airborn" if plane.location == "Airborn"
    return "The weather is too bad to fly" if bad_weather?
    @hanger.delete(plane)
    plane.airborn
  end

  def bad_weather?
    # rand(10).zero?
    # true
    false
  end

  def hanger_full?
    @hanger.count == @capacity
  end

end
