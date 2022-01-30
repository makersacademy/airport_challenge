class Airport
  def initialize(capacity = 10)
    @capacity = capacity
    @airplanes = []
  end

  def land(airplane)
    raise 'Cannot land airplane due to airport being full' if @airplanes.length >= @capacity
    @airplanes << airplane
  end

  def take_off(airplane)
  end
end
