# weather class

class Weather
  def initialize
    @the_weather = set_weather
  end

  attr_accessor :the_weather

  def set_weather
    rand(10) == 1 ? the_weather= :stormy : the_weather= :sunny
  end
end
