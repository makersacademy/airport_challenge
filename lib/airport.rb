require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
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
