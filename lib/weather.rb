class Weather

  def initialize(default = 15)
    # this wonderful variable lets you controll how
    # likely it is to be stormy. The higher it is,
    # the more likely it is to be stormy.
    @weather_tendancy = default
  end

  def forecast
    return "It's stormy!" if rand(100) < @weather_tendancy

    return "It's clear!"
  end

end
