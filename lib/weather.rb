class Weather
  attr_reader :weather

  def weather_rand
    rand(2)
  end

  def set_weather
    states = [ "sunny" ,"sunny", "stormy"]
    if states[weather_rand] == "sunny"
      @weather = false
    else
      @weather = true
    end
  end

  def stormy?
    @weather == true
  end

end
