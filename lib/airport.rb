require_relative 'weather.rb'
require_relative 'plane'
include Weather

class Airport

  attr_reader :airport, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def landing(plane)
    raise 'airport is full' if full?
    raise 'too stormy to land' if stormy? == true
    @airport << plane
    plane.land
  end

  def taking_off(plane)
    raise 'too stormy to take off' if stormy? == true
    raise 'airport is empty' if empty?
    plane.take_off
    @airport.pop
  end

  private

  def full?
    @airport.length >= @capacity
  end

  def empty?
    @airport.length == 0
  end

end
