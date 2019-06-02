#require 'airport'
#require 'plane'

class WeatherReport

  attr_accessor :tower_call
  STATES = ["clear", "sunny", "partly cloudy", "light rain", "light fog", 
            "overcast", "showers", "stormy", "stormy", "stormy"]

  def initialize
    pick = rand(10)
    @tower_call = STATES[pick]
  end

  def forecast
    return @tower_call
  end

end