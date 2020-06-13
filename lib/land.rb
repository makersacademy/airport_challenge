module Land
  def land(airport, weather = Weather.new)
    
    check_weather(weather)
    landed?
    full?(airport)

    @location = airport
    airport.hangar.push(self)
    self
  end

  def landed?
    if @location.class == Airport
      (raise StandardError.new "plane has already landed")
    end

  end

  def check_weather(weather)
    if weather.random_weather == "stormy"
      (raise StandardError.new "it is too stormy to land")
    end
  end

  def full?(airport)
    if airport.full?
      (raise StandardError.new "airport is full") 
    end
  end

end