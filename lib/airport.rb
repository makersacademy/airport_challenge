require 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :airport, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    fail 'airport is full' if full?
    airport << plane
  end

  def take_off(plane)
    raise 'airport is empty' if empty?
    airport.pop
    puts "#{plane} has left the airport"
  end

  def full?
    @airport.count >= capacity
  end
end
