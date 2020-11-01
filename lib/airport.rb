class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "ATTENTION - It is not possibile to land because the airport is full!" if full?
    raise "ATTENTION - It is not possible to land because of weather condition!" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "ATTENTION - It is not possible to take off because of weather condition!" if stormy?
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy? # method to have 2 in 8 chances to have stormy weather
    rand(1..8) > 6
  end
end
