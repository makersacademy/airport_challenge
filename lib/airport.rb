class Airport
  DEFAULT_CAPACITY = 50

  attr_accessor :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def gone?(plane)
    planes.none?(plane)
  end

  private

  def full?
    planes.count >= capacity
  end
end
