require_relative 'plane'

class Airport
  DEAFULT_WEATHER = "fine"

  attr_accessor :weather

  def initialize(weather=DEAFULT_WEATHER)
    @weather = weather
  end
  def land
    fail "The weather is stormy, we cannot land." if stormy_weather?
    "We're now in the airport, not the sky."
  end
  def takeoff
    fail "The weather is stormy, we cannot take off." if stormy_weather?
    "We're now in the sky, not the airport."
  end

  def stormy_weather?
    weather == "stormy"
  end
end