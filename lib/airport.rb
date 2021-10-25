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

  def take_off(plane)
    if planes.include?(plane)
      "Took off"
    else
      "This plane is not at the airport"
    end
  end

  def full?
    planes.length >= capacity
  end
end
