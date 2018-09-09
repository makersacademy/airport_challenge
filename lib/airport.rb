class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)

    @capacity = capacity
    @planes = []

  end

  def take_off

    fail "Too stormy to take off!" if stormy?
    plane = @planes.pop
    "#{plane} successfully taken off from #{self}" if plane

  end

  def stormy?
    rand(1..10) >= 7
  end

  def full?
    @planes.count >= @capacity
  end

  def dock(plane)
    fail "Plane already landed!" if @planes.include?(plane)
    @planes.push(plane)
  end

end
