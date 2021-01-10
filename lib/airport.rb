class Airport 
  
  def initialize(name, capacity=100) 
    @name = name 
    @capacity = capacity 
  end
  
  def landing(plane)
    case 
      when weather == 0 then print "Good visibility - land" 
        track_inbound(plane)
      when weather == 1 then print "Declining visibility - land with caution" 
        track_inbound(plane)
      when weather == 2 then print "Poor visibility - defer landing until further update"
    end
  end
  
  def take_off(plane)
    if @tracker.include?(plane)
      "Plane ready to take off"
      track_outbound(plane)
    else
      "Plane is not in airport"
    end
  end
  
  def track_inbound(plane)
    @tracker = []
    @tracker << plane
    return nil 
  end
  
  def track_outbound(plane)
    @tracker.delete(plane)
    print "Plane is no longer in the airport"
  end
  
  def weather 
    0 # rand(3) 
  end
end

