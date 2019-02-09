class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Plane alredy landed here" if hangared?(plane)
    raise "Airport full" if full?

    @hangar.push(plane)
  end

  def takeoff(plane)
    raise "Plane is not hanagared at this airport" unless hangared?(plane)
    raise "Cannot take-off; weather is stormy" if stormy?

    @hangar.delete(plane)
  end

  def full?
    @hangar.count >= capacity
  end

  def hangared?(plane)
    @hangar.include?(plane)
  end

  def stormy?
    [true, false, false, false, false].sample
  end

end
