require "./air_traffic_controller"
require "weather"


class SafetyCheck



  def initialize(capacity)
    @weather = Weather.new
    @capacity = capacity
  end

  def weather_check(weather)
    return 'Weather check: safe' if weather =='sunny'
    raise 'Too stormy to land safely' if weather == 'stormy'
  end

  def capacity_check(current_capacity_level)
    return 'Airport capacity level check: safe' if @capacity > current_capacity_level
    raise 'Airport too full to land safely'
  end

end
