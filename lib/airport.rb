require_relative 'plane'

class Airport

  Capacity = 5

  def initialize
    @plane_count = 0
  end

  def request_take_off(plane)
    plane.take_off_from(self)
    decrement_plane_count
  end

  def request_landing(plane)
    fail 'Airport is full' if full?
    plane.land_at(self)
    increment_plane_count
  end

  def has_plane?(plane)
    plane.landed_at?(self)
  end

  def full?
    plane_count >= Capacity
  end

  private

  attr_reader :plane_count

  def increment_plane_count
    @plane_count += 1
  end

  def decrement_plane_count
    @plane_count -= 1
  end

end
