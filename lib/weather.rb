class Weather
  attr_reader :weather

  CONDITION = {
      1 => 'clear',
      2 => 'rain',
      3 => 'cloud',
      4 => 'heavy rain',
      5 => 'stormy'
    }

  def initialize
    @weather = random_weather
  end 

  def random_number
    rand(1..5)
  end

  def random_weather
    CONDITION[random_number]
  end
end