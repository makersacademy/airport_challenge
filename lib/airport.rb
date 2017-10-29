class Airport

  attr_accessor :planes, :capacity

  def initialize
    @capacity = 1
    @planes = []
    @weather_conditions = :sunny
  end

  def weather_conditions
    return @weather_conditions = :stormy if rand(10) == 9
    @weather_conditions = :sunny
  end

  def full?
    return true if planes.length == capacity
  end
end
