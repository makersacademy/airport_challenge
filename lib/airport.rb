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
    if rand(10) == 9
      @weather_conditions = :stormy
    else
      @weather_conditions = :sunny
    end
  end

  def full?
    return true if planes.length == capacity
  end
end
