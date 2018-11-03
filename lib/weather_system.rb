class WeatherSystem
  attr_reader :weather_options

  def initialize
    @weather_options = ["Sunshine", "Fine", "Overcast", "Stormy"]
  end

  def rand_num_generator
    rand(0..3)
  end

  # def weather_selection
  #   self.weather_options[rand_num_generator]
  # end

end
