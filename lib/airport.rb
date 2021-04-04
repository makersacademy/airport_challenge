class Airport
  DEFAULT_CAPACITY = 25

  def initialize
    @planes = []
  end

  def land(plane)
    raise('Airport full!') if full?

    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def hangar?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end
end
