class Airport
  def initialize
    @airplanes = []
  end
  
  def land(airplane)
    @airplanes.push(airplane)
  end

  def take_off(airplane)
    @airplanes.delete(airplane)
  end

  def get_airplanes
    @airplanes
  end
end