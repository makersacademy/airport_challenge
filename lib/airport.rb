require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Cannot land plane: weather is stormy" if stormy?
    fail "Cannot land plane: airport is full" if full?
    @planes << plane
  end

  def confirm_landed(plane)
    if at_airport?(plane)
      "#{plane} has landed at airport"
    else
      "#{plane} has not landed at airport"
    end
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    fail "Cannot take-off: weather is stormy" if stormy?
    fail "Cannot take-off: plane not at this airport" unless at_airport?(plane)
    @planes.pop
  end

  def confirm_departed(plane)
    if at_airport?(plane)
      "#{plane} has not departed airport"
    else
      "#{plane} has departed airport"
    end
  end

  private

  def full?
    planes.count >= capacity
  end

  def stormy?
    Weather.new.stormy?
  end

  def at_airport?(plane)
    planes.include?(plane)
  end

end