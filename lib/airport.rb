class Airport

  def land(plane, weather = "sunny")
    @weather = weather
    if @weather == "stormy"
      "Plane not able to land due to storm"
    else 
      "#{plane} landed"
    end
  end

  def take_off(plane)
    "#{plane} has taken off"
  end

end
