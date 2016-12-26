class Weather
  def initialize
    @stormy = set_weather(random_number)
  end

  def stormy?
    @stormy
  end

  def set_weather(number = random_number)
    @stormy = (number == 0)
  end
  
  private

  def random_number
    rand(3)
  end


end
