class Airport
  attr_reader :planes
  BAD_WEATHER = 1

  def initialize
    @planes = []
  end

  def land(plane)
    if check_weather != BAD_WEATHER
      @planes.push(plane)
    end 
  end

  def take_off(plane)
    if check_weather == BAD_WEATHER
      return "bad weather: plane has not left"
    else
      @planes.delete(plane)
      return "plane has left"
    end
  end

  def check_weather
    rand(100)
  end

end
