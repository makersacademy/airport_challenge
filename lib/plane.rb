class Plane
  attr_accessor :in_air
  def initialize
    @in_air = true 
  end

  def in_air?
    @in_air
  end 

  def ready_for_takeoff?
    @in_air = false
  end 
      
  def ready_to_land?
    @in_air = true
  end

end
