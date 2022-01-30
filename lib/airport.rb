class Airport
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airplanes = []
  end

  def land(airplane)
    raise 'Cannot land airplane due to airport being full' if full?
    @airplanes << airplane
  end

  def take_off(airplane)
  end
  
  def full?
    @airplanes.length >= @capacity
  end
end
