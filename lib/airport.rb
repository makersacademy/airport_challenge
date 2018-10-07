class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  NOT_IN_THIS_AIRPORT = 'Plane is not in this airport!'
  ALREADY_AT_THIS_AIRPORT = 'Plane is already at an airport!'
  IS_FULL = 'Airport is full!'

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def add_plane(plane)
    fail ALREADY_AT_THIS_AIRPORT if plane?(plane)
    fail IS_FULL if full?
    @planes << plane
    plane
  end

  def remove_plane(plane)
    fail NOT_IN_THIS_AIRPORT unless plane?(plane)
    @planes.delete(plane)
  end

  def plane?(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.size == @capacity
  end

end
