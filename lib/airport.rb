class Airport
  attr_reader :hangar
  
  def initialize
    @hangar = []
  end

  def land(plane)
    raise 'That plane has already landed.' if parked?(plane)

    @hangar << plane
  end

  def take_off(plane)
    raise 'That plane is not here.' unless parked?(plane)
    
    @hangar.delete_at(parking_spot(plane))
    @hangar
  end

  private

  def parked?(plane)
    @hangar.index(plane) != nil
  end

  def parking_spot(plane)
    @hangar.index(plane)
  end

end
