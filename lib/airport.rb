class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :planes
  attr_reader :capacity
  

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    if full?
      "This airport is full - cannot land"
    else
      planes.push(plane)
      "Landed"
    end
  end

  def take_off(_plane)
    "Took off"
  end

  def full?
    planes.length >= capacity
  end
end
