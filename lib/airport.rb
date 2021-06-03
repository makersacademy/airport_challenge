class Airport
  def initialize(capacity = 1)
    @airplanes = []
    @capacity = capacity
  end
  
  def land(airplane)
    @airplanes.push(airplane) if @airplanes.length < @capacity
  end

  def take_off(airplane)
    @airplanes.delete(airplane)
  end

  def get_airplanes
    @airplanes
  end

  def get_capacity
    @capacity
  end
end