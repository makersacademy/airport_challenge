require_relative './plane'
require_relative './weather'

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :planes
  attr_accessor :capacity

  def land(plane, weather)
    fail 'cannot land as the airport is full' if full?
    fail 'plane already landed' unless flying?(plane)
    fail 'cannot land due to stormy conditions' if weather.stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane, weather)
    fail 'no planes at airport' if empty?
    fail 'plane not at airport' unless at_airport?(plane)
    fail 'cannot take off due to stormy conditions' if weather.stormy?
    plane.take_off
    @planes.delete(plane)
    @planes
  end

private

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY

  end

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

  def flying?(plane)
    plane.flying?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

end
