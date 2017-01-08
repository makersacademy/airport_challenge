# weather class

class Weather
  def initialize
    @current_weather = generate_weather
  end

  attr_reader :current_weather

  def generate_weather
    num = rand(10)
    if num == 1
      return 'stormy'
    else
      return 'sunny'
    end
  end

  def stormy?
    self.current_weather == 'stormy'
  end

end
