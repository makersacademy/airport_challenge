class Airport
attr_reader :hangar

  def initialize
    @hangar = []
   #@ weather = Weather.new
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
    plane.take_off
  end
  
  def stormy?
  end 
 
end
