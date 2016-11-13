require_relative 'plane.rb'
require_relative 'weather.rb'
AIRPORT_CAPACITY = 12

class Airport

  attr_reader :planes,:capacity

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane,weather)
    raise ("This plane has already landed") if plane.landed
    # raise ("This plane has already landed") if @planes.include?(plane)
    raise ("Cannot land planes if the weather if stormy") if weather == "Stormy"
    raise ("Sorry, Airport is full, please fly to another") if full?
    plane.landed = true
    @planes << plane
  end

  def take_off(plane,weather)
    raise ("That plane is not in this airport") unless @planes.include?(plane)
    raise ("Cannot take off in stormy weather") if weather == "Stormy"
    planes.delete(plane)
  end

  def full?
    self.planes.count == AIRPORT_CAPACITY
  end


end
