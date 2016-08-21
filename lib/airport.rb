require_relative 'weather'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
    @capacity =35
  end

  def land (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    false unless @planes > @capacity
    planes << plane
    plane
  end

  def take_off (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    planes.delete(plane)
  end

end
