require "./air_traffic_controller"
require "weather"


class SafetyCheck

  DEAFAULT_CAPACITY = 5

  def initialize
    @weather = Weather.new
    @capacity = DEAFAULT_CAPACITY
  end

  

end
