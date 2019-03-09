require_relative 'weather.rb'

class Airport

  attr_reader :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = 100
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
