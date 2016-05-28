class Weather

  attr_accessor :current_weather, :random_number
  attr_reader :stormy

  def initialize
    @current_weather = current_weather
    @random_number = 0
  end

  def weather_report
    weather_generator
  end

  def weather_generator
    random_number = rand
    weather_output(random_number)
  end

  def weather_output(random_number)

    if(random_number >= 0.10 && random_number < 0.95)
      current_weather = "sunny"
      "The weather is currently: #{current_weather}"

    elsif (random_number < 0.10)
      current_weather = "stormy"
      "The weather is currently: #{current_weather}"

    else
      current_weather = "hamburgers"
      "The weather is currently: #{current_weather}"
    end

  end


end
