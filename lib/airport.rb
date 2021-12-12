class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Caution: Airport full, plane cannot land. MAX capacity: 10' if full?
    @planes << plane
  end

  def take_off(plane)
  end


  private 

  def full?
    #predicate statement
    @planes.length >= @capacity
  end
end