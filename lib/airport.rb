require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  attr_accessor :hanger, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    fail 'Hanger is full' if full?
    fail 'Weather is stormy' if stormy?
    @hanger << plane
  end

  def take_off(plane)
    fail 'Weather is stormy' if stormy?
    @hanger.delete(plane)
  end

  private
  
  def full?
    @hanger.count >= @capacity
  end
end
