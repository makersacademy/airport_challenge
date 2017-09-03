require_relative 'airport'

module Runway

  def initialize(capacity = DEFAULT_CAPACITY)
    new_runway(capacity)
  end

  def runway_traffic
    @@runway_traffic
  end

  def runway_capacity
    @capacity
  end

  def plane_is_already_landed?(plane)
    @@runway_traffic.include?(plane)
  end

  private

  def new_runway(capacity)
    @@runway_traffic = []
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 5

end

module Weather

  @poss_weather_conditions = [true, false]

  def stormy?
    @@stormy = @poss_weather_conditions.sample
  end

end

# attr_reader :AIRPORT_CAPACITY
# @AIRPORT_CAPACITY = 1
