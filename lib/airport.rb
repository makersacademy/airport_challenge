require_relative 'plane'

class Airport

  attr_reader :landed_planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "#{plane} is currently at an airport" if plane.landed?
    fail "#{self} is currently at full capacity" if full?
    fail "Plane cannot land due to stormy conditions" if stormy?
    landed_planes << plane
    plane.report_landed
    "#{plane} has landed at #{self}"
  end

  def take_off(plane)
    fail "#{plane} is already in the air" if !plane.landed?
    fail 'Plane cannot take off due to stormy conditions' if stormy?
    landed_planes.delete(plane)
    plane.report_taken_off
    "#{plane} has taken off from #{self}"
  end

  def change_capacity(new_capacity)
    self.capacity = new_capacity
  end

  def stormy?
    true if rand(5) == 0
  end

  def full?
    true if landed_planes.length >= capacity
  end

end
