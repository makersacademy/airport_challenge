class Weather
  attr_reader :current_weather
  def generate_weather
    if rand(5) == 1
      @current_weather = "Storm"
    else      
      @current_weather = "Not Storm"
    end
  end
end
