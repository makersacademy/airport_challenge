require_relative 'plane'

class Airport
  attr_reader :grounded_planes # the same as creating a 'grounded_planes' method that returns grounded_planes.
  DEFAULT_CAPACITY = 50 # create this so when a initial argument for airport is not passed we still create one

  def initialize(n = DEFAULT_CAPACITY) # when a new airport is created it has an empty
    @capacity = n                      # array with a capacity of DEFAULT_CAPACITY planes
    @grounded_planes = []
  end

  def plane_landing(plane)
    raise 'Cannot land plane: Airport is full' if airport_full? # raise = raise error
    @grounded_planes << plane
  end

  def plane_takeoff(plane)

  end

  def airport_full? # create this method to take this function
    @grounded_planes.length >= @capacity
  end

  def airport_empty?

  end



end
