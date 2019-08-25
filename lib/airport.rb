class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_array = []
  end

  def land(plane)
    @planes_array.push(plane)
  end

  def full?
    true if @planes_array.length == @capacity
  end

  def contains?(plane)
    @planes_array.include?(plane) ? true : false
  end

end
