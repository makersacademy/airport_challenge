class Airport

  def initialize
    @planes = []
  end

  def planes
    @planes
  end

  def land(plane)
    if weather == "sunny"
      plane.land!
      planes.push(plane)
    else
      fail "Too stormy to land!"
    end
  end

  def take_off(plane)
    if weather == "sunny"
      plane.take_off!
      @planes.delete(plane)
    else
      fail "Too stormy to take off!"
    end
  end

  def weather
    possible_weather = ["sunny", "sunny", "sunny", "stormy"]
    possible_weather.sample
  end



end
