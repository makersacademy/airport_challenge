require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 10  

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
  end

  def take_off(plane)
    "#{plane} has successfully taken_off from #{self}."
  end

end
