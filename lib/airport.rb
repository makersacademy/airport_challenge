require_relative 'plane'

class Airport
  attr_accessor :hanger, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def stormy?
    rand(2).zero?
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
