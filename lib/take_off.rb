module TakeOff
  def in_the_air?
    @location == "in the air"
  end

  def correct_airport?(airport)
    airport != @location
  end

  def take_off(provided_airport, weather = Weather.new)
    if weather.random_weather == "stormy"
      (raise StandardError.new "the weather, it is a stormy")
    elsif in_the_air?
      (raise StandardError.new "plane has already taken off")
    elsif correct_airport?(provided_airport)
      (raise StandardError.new "plane is at a different airport")
    else 
      @location = "in the air"
    end
  end
end