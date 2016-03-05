class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
  end
  
  def hangar
    @hangar
  end
end
