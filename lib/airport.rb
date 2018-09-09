class Airport
  def weather_rand
    rand(100)
  end

  def takeoff
    raise "It is too stormy to take off!" if weather_rand <= 10
    Plane.new
    "Plane departed."
  end

  def land(plane)
    raise "It is too stormy to land!" if weather_rand <= 10
    @plane = plane
    "Plane landed."
  end
end
