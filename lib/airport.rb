require_relative 'plane'
require_relative 'atc'

class Airport

  attr_reader :capacity
  attr_reader :hangar

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @no_of_planes_in_hangar = @hangar.length
  end

  def add_to_hangar(plane)
    #print plane
    @hangar << plane
  end

  def remove_from_hangar(plane)
    @hangar.delete(plane)
  end
end
