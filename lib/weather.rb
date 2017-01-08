class Weather

  attr_accessor :current_weather

  def initialize
    @current_weather = make_weather(random_num)
  end

  def random_num
    rand(1..10)
  end

  def make_weather(number)
    if number < 7
      @current_weather = "Sunny"
    else
      @current_weather = "Stormy"
    end
  end

end
