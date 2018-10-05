class Airport

  def land(plane)
    return "Plane has landed"
  end

  def takeoff(plane)
    return "Plane has taken off"
  end

  def check_weather
    chance = rand(10)
    if (0..7).include?(chance)
      @weather = "sunny"
    else
      @weather = "stormy"
    end
  end

end
