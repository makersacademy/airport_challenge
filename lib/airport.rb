require_relative 'weather'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land (plane)
    planes << plane
    plane
  end

  def take_off (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    planes.delete(plane)
  end

end
