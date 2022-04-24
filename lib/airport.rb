class Airport

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_accessor :capacity
  attr_reader :planes

  def land(plane)
    fail 'Airport full' if @planes.count >= @capacity
    fail 'Plane cannot land on stormy weather' if weather == "stormy"
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane cannot take off on stormy weather' if weather == "stormy"
    fail 'Plane not in this airport' unless plane_in_airport?(plane)
    planes.delete(plane)
    "#{plane} no longer in #{self} airport"
  end

  def weather
    return "stormy" if rand(20) == 1
    "sunny"
  end

  def plane_in_airport?(plane)
    planes.include?(plane)
  end

end
