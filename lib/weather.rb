class WeatherStation

  def initialize(number_generator = Random.new)
    @number_generator = number_generator
  end

  def todays_weather
    if @number_generator.rand(5) == 4
      :stormy
    else
      :sunny
    end
  end

end
