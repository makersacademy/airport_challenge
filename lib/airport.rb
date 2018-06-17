require_relative './weather.rb'

class Airport
  def weather
    Weather.new
  end

  def stormy?(weather)
    weather.condition == 'stormy'
  end
end
