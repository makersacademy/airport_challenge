require_relative 'airport'

module Runway

  def new_runway
    @runway_traffic = []
    @capacity = 5
  end

  def runway_traffic
    @runway_traffic
  end

  def set_capacity
    @capacity
  end

end

module Weather

  def stormy?
    poss_weather_conditions = [true, false]
    @@stormy = poss_weather_conditions.sample
  end

end

# attr_reader :AIRPORT_CAPACITY
# @AIRPORT_CAPACITY = 1
