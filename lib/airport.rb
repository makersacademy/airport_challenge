require_relative 'plane'

class Airport

  attr_accessor :capacity

  def initialize (capacity=2)
    @capacity = capacity
    @hangar = []
  end

  def land plane
    fail 'airport full, permission denied' if full?
    hangar << plane
    plane.landed
  end

  def take_off plane
    plane.status = "flying"
    hangar.pop
  end

  private

  attr_reader :hangar

  def full?
    hangar.count >= capacity
  end
end