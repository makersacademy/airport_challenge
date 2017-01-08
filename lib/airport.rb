require_relative 'plane'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Stormy weather preventing landing" if stormy?
    raise "Airport is full" if full?
    @planes << plane
    plane.airborne = false
    "#{plane} has landed"
  end

  def take_off(plane)
    raise 'Stormy weather preventing take off' if stormy?
    raise 'No planes available' if empty?
    plane.airborne = true
    @planes.delete plane
    "#{plane} has taken off"
  end

  private

  def stormy?
    rand > 0.5? true : false
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
