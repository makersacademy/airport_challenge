class Plane
attr_reader :space
attr_reader :weather

  def initialize
    @airport_capacity = 1
    @weather = ["sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  def weather_conditions
    @weather.sample
    raise 'weather is too stormy to takeoff or land' if (@weather.sample == "stormy")
  end

  def land(number_of_planes)
    weather_conditions
    raise 'airport is too full to land' if (@airport_capacity < number_of_planes)
    return "landed successfully"
  end

  def take_off
    weather_conditions
    return "left airport"
  end

end
