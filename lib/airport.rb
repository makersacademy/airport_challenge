class Airport

  def initialize
    @hangar = []
  end 

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

  def is_in_hangar?(plane)
    @hangar.include?(plane)
  end 

end 
  