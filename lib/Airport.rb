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
    weather = check_weather
    raise "The weather is stormy - no take off allowed" if weather == "Stormy"

    if @airport_planes == plane
      @airport_planes = nil
      return "Successful take off"
    end

    raise "That plane isn't at the airport"
  end

  def check_weather
    random = Random.rand(1..50)
    return "Sunny" if random != 25

    return "Stormy"
  end
end
