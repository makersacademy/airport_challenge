require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :airport, :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = airport
    @hangar = []
    @capacity = capacity
  end

  def full
    hangar.size >= capacity
  end

  def stormy?
    weather.forecast
  end
end
