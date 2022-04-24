class Airport

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_accessor :capacity

  def land(plane)
    fail 'Airport full' if @planes.count >= @capacity
    fail 'Plane cannot land on stormy weather' if weather == "stormy"
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane cannot take off on stormy weather' if weather == "stormy"
    @planes.pop
    "#{plane} no longer in #{self} airport"
  end

  def weather
    return "stormy" if rand(20) == 1
    "sunny"
  end

end
