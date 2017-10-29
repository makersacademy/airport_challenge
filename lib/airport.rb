class Airport
  attr_accessor :planes, :capacity

  def initialize
    @capacity = 1
    @planes = []
    @weather_conditions = :sunny
  end

  def dock(plane)
    @planes << plane
  end

  def confirm_take_off(plane)
    @planes.delete(plane)
  end

  def weather_conditions
    @weather_conditions = :stormy if rand(3) == 2
    @weather_conditions
  end

  def full?
    return true if self.planes.length == self.capacity
  end
end
