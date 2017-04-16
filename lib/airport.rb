require_relative 'plane'

class Airport

  def land(plane)
    fail 'Landing denied, airport is full!' if @plane
    @plane = plane
  end

  def take_off(plane)
    @plane = plane
  end

end
