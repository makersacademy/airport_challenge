class Plane 
  def land(airport)
    if airport.respond_to?(:accept?) && airport.accept?
      return airport.receive(self)
    else
      return false
    end 
  end

end