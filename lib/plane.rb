class Plane
  
  attr_reader :in_air
  
  def initialize 
    @in_air = true
  end
  
  def plane_in_air
    @in_air = true
  end 
  
  def plane_in_airport
    @in_air = false
  end
  
  def flying?
    @in_air
  end
  
end
