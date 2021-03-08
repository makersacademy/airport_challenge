class AirTrafCon

  def land_plane(airport)
    return "Can't land now, inclement weather" if weather.zero?
  end

  def dispatch_plane(airport)
    return "Can't depart now, inclement weather" if weather.zero?
  end

  def weather
    rand(0, 1) # 0 is stormy
  end

end
