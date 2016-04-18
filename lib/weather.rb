class Weather
BAD_WEATHER_INDEX = 0.25

  def is_stormy?
    Random.new.rand(1.0) < BAD_WEATHER_INDEX
  end
end
