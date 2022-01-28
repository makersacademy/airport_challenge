class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
  end


  def take_off(plane)

  end

  def land(plane)
    raise "Airport at full capacity." if airport_full?
    @planes << plane
  end

  private

  def airport_full?
    @planes.size == @airport_capacity
  end
end
