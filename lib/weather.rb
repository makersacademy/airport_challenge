require 'pry'

class Weather
  def initialize
    @weather = rand(2)
  end

  def check_weather
    if @weather == 1
      "stormy"
    else
      "fine"
    end
  end

end
