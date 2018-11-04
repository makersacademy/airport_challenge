class WeatherSystem
  attr_reader :weather_options

  def rand_num_generator
    rand(1..4)
  end

  def weather_output
    rand_num_generator == 1 ? 'Stormy' : 'Sunshine'
  end

end
