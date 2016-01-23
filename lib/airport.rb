
require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 25

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def at_capacity?
    @planes.count >= capacity
  end

  def weather_conditions
    weather
  end

end
