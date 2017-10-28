class Plane
  def land(airport)
    "Plane has landed at #{airport}. "
  end

  def take_off(airport, weather)
    @weather = weather
      if @weather == "stormy"
        "Plane will not be taking off due to stormy weather"
      else
        "Plane has taken off and is no longer in #{airport}"
      end
  end
end
