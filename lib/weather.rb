

module Weather
  def sunny?
    weather_array = [true. true, true, false]
    @weather_conditions = weather_array[rand(0..3)]
  end
end
