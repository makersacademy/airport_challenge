class Airport

  attr_reader :airport_planes

  def land(plane)
    @airport_planes = plane
    return "Plane landed"
  end

  def planes
    return @airport_planes
  end

  def take_off(plane)
    if @airport_planes == plane
      @airport_planes = nil
      return "Successful take off"
    end
    raise "That plane isn't at the airport"
  end

  def check_weather
    return "Sunny"
  end
end
