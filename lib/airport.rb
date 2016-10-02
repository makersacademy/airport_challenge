class Airport

attr_reader :plane

def initialize
end

def land(plane)
  @plane = plane
  print "Plane has landed" if defined? @plane
end

def confirm_landing

end

end
