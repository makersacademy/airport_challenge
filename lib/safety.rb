require "./air_traffic_controller"
require "weather"


class SafetyCheck



  def initialize(capacity)
    @capacity = capacity

  end

  def weather_check(weather)
    return 'Weather check: safe' if weather !='stormy'
    raise 'Too stormy to land safely' if weather == 'stormy'
  end

  def capacity_check(current_capacity_level)
    return 'Airport capacity level check: safe' if @capacity > current_capacity_level
    raise 'Airport too full to land safely'

  end


  def is_landing_safe?(current_capacity_level,weather)
    weather_check(weather) && capacity_check(current_capacity_level)
    puts 'Landing can be now done safely!'
    return true
  end

  def is_take_off_safe?(weather)
    weather_check(weather)
    puts 'Take off can be now done safely!'
    return true
  end

end
