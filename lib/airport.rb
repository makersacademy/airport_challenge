# frozen_string_literal: true

require_relative 'plane.rb'
# airport class
class Airport
  attr_reader :airport_hangar, :capacity, :gates_remaining
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_hangar = []
    @capacity = capacity
    @taxied_planes = 0
  end

  def landing(plane)
    raise 'this plane has already landed!' if airport_hangar.include?(plane)
    raise 'the airport is full!' if airport_hangar.count >= capacity
    airport_hangar << plane
    @taxied_planes += 1
    "#{plane} has landed!"
  end

  def taking_off(plane)
    raise 'this plane has already taken-off!' unless airport_hangar.include?(plane)
    airport_hangar.delete(plane)
    @taxied_planes -= 1
    "#{plane} has taken-off!"
  end
end
