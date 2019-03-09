require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity, :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    hangar << plane
  end

end
