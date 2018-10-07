class Airport
  attr_reader :name, :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(name = self, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def request_landing(plane)
    if @planes.count < @capacity
      @planes << plane
      plane.landed = true
    else
      raise "ERROR: Airport is full. Request rejected."
    end
  end

  def request_take_off(plane)
    @planes.delete(plane)
    plane.landed = false
  end
end
