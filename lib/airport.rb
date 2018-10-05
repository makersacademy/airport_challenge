class Airport

  def initialize
    check_weather
  end

  def land(plane)
    raise "Unable to land due to stormy weather" if $weather == "stormy"
    return "Plane has landed"
  end

  def takeoff(plane)
    raise "Unable to takeoff due to stormy weather" if $weather == "stormy"
    return "Plane has taken off"
  end

  def check_weather
    chance = rand(10)
    if (0..7).include?(chance)
      $weather = "sunny"
    else
      $weather = "stormy"
    end
  end

end
