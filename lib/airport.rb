require_relative './plane.rb'

class Airport

  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane already at airport" if in_hangar?(plane)
    fail "Hangar is full" if full?
    hangar.push(plane)
  end

  def take_off(plane)
    fail "Plane not at airport" unless in_hangar?(plane)
    hangar.delete(plane)
    "#{plane} has left the airport"
  end

  private

  def in_hangar?(plane)
    hangar.include?(plane)
  end

  def full?
    hangar.length >= capacity
  end

end
