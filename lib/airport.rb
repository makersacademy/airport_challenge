class Airport
  def initialize
    @airplanes = []
    @capacity = 1
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
end