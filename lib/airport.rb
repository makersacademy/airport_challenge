class Airport
  
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)

    @capacity = capacity
    @planes = []

  end

  def take_off

    fail "Too stormy to take off!" if stormy?
    plane = @planes.pop
    return "#{plane} successfully taken off from #{self}"

  end

  def stormy?

    if rand(1..10) >= 7
      true
    else
      false
    end

  end

  def full?

    if @planes.count >= @capacity
      true
    else
      false
    end

  end

  def dock(plane)
    @planes.push(plane)
  end

end
