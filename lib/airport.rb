class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = 0
  end

  def land(plane)
    raise 'Caution: Airport full, plane cannot land. MAX capacity: 10' if @planes_landed >= @capacity
    @planes_landed = @planes_landed + 1
  end

  def take_off(plane)
  end
end