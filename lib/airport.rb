class Airport

  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 50

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def set_capacity(num)
    @capacity = num
  end

  def land(plane)
    raise 'Airport full.' if full?
    planes << plane
  end

  def take_off(plane)
    raise 'Plane not at airport.' unless planes.include? plane
    planes.delete(plane)
  end

  private

  def full?
    planes.length >= capacity
  end

end
