require_relative 'airport'

module Runway

  def runway_traffic
    @runway_traffic
  end

  def runway_capacity
    @capacity
  end

  def new_runway(capacity = DEFAULT_CAPACITY)
    @runway_traffic = []
    @capacity = capacity

  end
  DEFAULT_CAPACITY = 5

  def runway_hasher
    @@runway_hash = {}
    Airport.all_offspring.each { |x| @@runway_hash[x] = x.instance_variable_get(:@runway_traffic) }
  end

end

module Weather

  @@poss_weather_conditions = [true, false]

  def stormy?
    @@stormy = @@poss_weather_conditions.sample
  end

end

# attr_reader :AIRPORT_CAPACITY
# @AIRPORT_CAPACITY = 1
