class Plane

  def initialise
    @at_airport  
  end
  
  def land  
  end

  def take_off
    @at_airport = false
  end

  def at_airport?
    @at_airport  
  end


end