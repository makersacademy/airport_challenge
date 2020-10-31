class Airport
  attr_reader :plane

def land(plane)
  @plane = plane
end  

def take_off
  return "plane has taken off and longer at airport"
end

end