require_relative 'weather.rb'

class Airport

  DEFAULT_CAPACITY = 100
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Cannot land due to stormy weather" if stormy?
    raise "Cannot land - airport full" if full?

    @hangar << plane
  end

  def take_off
    raise "Cannot depart due to stormy weather" if stormy?

    @hangar.pop
  end

  def stormy?
    Weather.new.forecast == 'Stormy'
  end

  def full?
    @hangar.count >= @capacity
  end

end
