require_relative 'plane'


class Airport
  attr_reader :hangar, :capacity

  def initialize(capacity=6)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Hangar is at its full capacity" if hangar.count == capacity
    hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
    "#{plane} has just taken off"
  end
end