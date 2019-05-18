class Plane
  def land(weather)
    !weather.stormy ? true : false
  end

  def take_off(weather)
    !weather.stormy ? true : false
  end
end
