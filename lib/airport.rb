class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Caution: Airport full, plane cannot land. MAX capacity: 10' if full?

    raise 'Caution: Airport cannot land plane, weather is stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Caution: Airport cannot take off plane, weather is stormy' if stormy?
  end


  private 

  def full?
    #predicate statement
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..10) > 8
  end
end