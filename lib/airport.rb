require_relative 'plane'


class Airport
  attr_reader :hangar, :capacity

  def initialize(capacity=6)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    if hangar.include?(plane)
      raise "Already in hangar"
    elsif hangar.count == capacity
      raise "Hangar is at its full capacity"
    else
      hangar << plane
    end 
  end

  def take_off(plane)
    raise "Plane not in hangar" if !hangar.include?(plane)
    hangar.delete(plane)
    "#{plane} has just taken off"
  end
end