require_relative 'plane'

class Airport

  attr_reader :plane, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "This plane has already landed!" if @plane.include? plane
    fail "Too stormy!" if stormy?
    fail "Airport full!" if full?
    @plane << plane
  end

  def take_off(plane)
    fail "This plane is not at the airport!" if empty?
    fail 'This plane is not at the airport!' unless @plane.include? plane
    fail "Too stormy!" if stormy?
    @plane.delete(plane)
  end

  def empty?
    @plane.count.zero?
  end

  def stormy?
    [true, false, false, false].sample
  end

  def full?
    @plane.length >= capacity
  end

end
