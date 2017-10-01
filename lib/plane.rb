class Plane

  def arrive_at_airport
    raise "Too stormy to depart" if @weather_rand <= 25
  end

  def depart_from_airport
    raise "Too stormy to depart" if @weather_rand <= 25
  end

  def stormy_weather?
    @weather_rand = rand(100)
  end

end
  
