require_relative './weather.rb'

class Airport
  def initialize(weather)
    @weather = weather
  end

  def stormy?
    @weather.condition == 'stormy'
  end
end
