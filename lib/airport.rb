require_relative 'weather'

class Airport

  def plane_land
    return "Weather stormy, do not land." if (Weather.new.check == "stormy")
    @plane = true
    "Please land your plane."
  end

  def plane_take_off
    @plane = false
    "Please take off."
  end

  def plane?
    @plane
  end

  def check_weather
    Weather.new.check
  end

end
