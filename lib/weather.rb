class Weather

  def initialize(x = 15)
    #this wonderful variable lets you controll how
    #likely it is to be stormy. The higher it is,
    #the more likely it is to be stormy.
    @weather_tendancy = x
  end

  def forecast
    if rand(100) < @weather_tendancy
      return "It's stormy!"
    else
      return "It's clear!"
    end
  end

end
