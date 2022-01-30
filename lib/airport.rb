class Airport
  def initialize(capacity = 10)
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
