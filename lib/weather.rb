class Weather
  attr_reader :current_weather, :number
  def initialize
    @number = random_weather
    @current_weather = type(@number)
  end
  
  private

  def random_weather
    rand * 100
  end
  def type(number)
    return "sunny" if number < 50
    return "raining" if number < 70
    "stormy"
  end

end
