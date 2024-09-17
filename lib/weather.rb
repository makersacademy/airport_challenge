require 'airport'

class Weather

attr_reader :weather

  def initialize
    @weather = $def_weather
  end

  def stormy?
    return true if (@weather == @stormy)
  end

end
