require_relative 'plane.rb'
require_relative 'weather.rb'
AIRPORT_CAPACITY = 12

class Airport

  attr_reader :planes,:capacity

  def initialize
    @planes = []
    @capacity = AIRPORT_CAPACITY
  end

  def land(plane,weather)
    raise ("Cannot land planes if the weather if stormy") if weather == "Stormy"
    raise ("Sorry, Airport is full, please fly to another") if full?
    @planes << plane
  end

  def take_off(plane,weather)
    raise "Cannot take off in stormy weather" if weather == "Stormy"
    planes.delete(plane)
  end

  def full?
    self.planes.count == AIRPORT_CAPACITY
  end


end
