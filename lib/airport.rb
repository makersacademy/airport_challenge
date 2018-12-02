class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def weather_reporter(rand)
    if rand >= 3
      p "Sunny"
    else
      p "Stormy"
    end
  end

  def land(plane)
    @plane << plane
  end

  def take_off(plane)
    if weather_reporter(1) == "Sunny"
      p "The weather is sunny, safe to take off.\nPlane #{plane.object_id} has successfully left the airport"
    else
      p "The weather is too stormy, you cannot take_off"
    end
  end

end
