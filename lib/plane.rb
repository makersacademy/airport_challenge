class Plane
  
  def initialize(flying = true)
    @flying = flying
  end
   
  def land(airport)
    return raise("Already Grounded") unless @flying
    puts "still going"
    @flying = false
    airport.land(self)
  end

end
