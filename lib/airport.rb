class Airport

  def initialize(capacity)
    @capacity = (capacity)
  end

  def initialize(planes = [])
    @planes = planes 
    
  end 

  def plane_land(plane)
    @planes.push(plane)
  end

  def plane_take_off(plane)
    @planes.remove(plane)
  end

end




