require 'pry'

class Weather
  def initialize
    @weather = rand(4)
  end

  def check_weather
    if @weather == 0
      "stormy"
    else
      "sunny"
    end
  end

end
