class Weather
  attr_reader :meteo
  def weather_condition
    @meteo = ["sunny", "sunny", ["stormy", "sunny"].sample, "sunny"].sample
  end

 

end
