require_relative 'weather'
require_relative 'plane'

class Airport

  attr_accessor :capacity
  attr_reader :weather
  attr_reader :landed_planes
  DEFAULT_CAPACITY = 20


  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity


  end

  def non_ideal_weather?
    Weather.new.weather_condition?
  end

  def land(plane)
    raise 'Landing denied: airport full' if @landed_planes.count >= @capacity
    @landed_planes << plane

  end

  def landed?(plane)
    if landed_planes.include? plane
      return true
    else
      return false
    end
  end

  def take_off(plane)
    fail "Take off denied: ideal weather conditions not met" if non_ideal_weather? == true
    @landed_planes.delete(plane)
  end

  def taken_off?(plane)
     return !@landed_planes.include?(plane)
    # if @landed_planes.include? plane
    #   return false
    # else
    #   return true
    #  end
  end

end
