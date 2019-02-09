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
    raise "Cannot take-off; weather is stormy" if stormy?

    @hangar.pop
  end

  def full?
    @hangar.count >= capacity
  end

  def stormy?
    [true, false, false, false, false].sample
  end

end
