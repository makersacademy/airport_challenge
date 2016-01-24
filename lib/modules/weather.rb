module Weather

  WEATHER = ["sunny","sunny","sunny","sunny","stormy",
             "sunny","sunny","stormy","sunny","sunny"].freeze

  def weather_status
    WEATHER.sample
  end

end
