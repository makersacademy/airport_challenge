class Airport

  attr_reader :planes, :conditions

  def initialize
    @planes = []
    @conditions
  end

  def land(plane)
    planes << plane
  end

  def landed?(plane)
    planes.include?(plane)
  end

  def take_off(plane)
    fail "Stormy weather! Not safe to fly." if conditions == "stormy"
    planes.delete(plane)
  end

  def weather_conditions(condition)
    @conditions = condition
  end

end
