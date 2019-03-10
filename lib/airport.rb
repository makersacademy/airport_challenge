require_relative 'weather.rb'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 100
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Plane already landed!" if @hangar.include?(plane)
    raise "Cannot land due to stormy weather" if stormy?
    raise "Cannot land - airport full" if full?

    @hangar << plane
  end

  def take_off(plane)
    puts @hangar
    raise "Plane not in airport" unless @hangar.include?(plane)
    raise "Cannot depart due to stormy weather" if stormy?

    @hangar.delete(plane)
    puts "#{plane} has taken off"
  end

  def stormy?
    Weather.new.forecast == 'Stormy'
  end

  def full?
    @hangar.count >= @capacity
  end

end
