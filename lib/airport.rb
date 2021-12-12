class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = 0
  end

  def land(plane)
    raise 'Caution: Airport full, plane cannot land. MAX capacity: 10' if full
    @planes_landed = @planes_landed + 1
  end

  def take_off(plane)
  end

  def full
    #predicate statement
    @planes_landed >= @capacity
  end
end