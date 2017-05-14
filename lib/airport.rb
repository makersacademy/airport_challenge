
class Airport

  attr_accessor :capacity
  attr_reader :planes


  DEFAULT_CAPACITY = 9

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def weather_is_stormy?
    return rand(1..7) > 5
  end

  def land(plane)
    raise "Plane can not land due to stormy weather" if self.weather_is_stormy?
    raise "Plane can not land because the airport is full" if self.is_full?
    raise "The plane is already landed" if @planes.include? plane
    raise "plane already landed in another airport" if plane.landed
    plane.landed = true
    @planes << plane

  end

  def take_off(plane)
    raise "Plane can not take off due to stormy weather" if self.weather_is_stormy?
    raise "The plane is already taken off" if !@planes.include? plane
    plane.landed = false
    @planes.delete(plane)
  end

  def is_full?
    @planes.count >= @capacity
  end

end
