require_relative 'weather'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
    @capacity = 35
  end

  def land (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    if @planes.count >= @capacity
      false
    else
      planes << plane
      plane
    end
  end

  def take_off (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    planes.delete(plane)
  end

end
