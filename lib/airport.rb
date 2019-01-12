class Airport



  def initialize(capacity=20)
    @capacity = capacity
    @planes = []
  end

  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    @planes.push(plane)
  end

end
