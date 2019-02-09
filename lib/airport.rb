class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)   
    raise "Airport full" if full?

    @hangar.push(plane)
  end

  def takeoff_plane
    @hangar.pop
  end

  def full?
    @hangar.count >= capacity
  end

end
