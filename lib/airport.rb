class Airport

attr_accessor :planes, :weather

def initialize
  @planes = []
  @weather = "sunny"
end

def land(plane)
  raise "It is too stormy for the plane to land" if self.weather == "stormy"
  @planes << plane
end

def take_off(plane)
  raise "It is too stormy for the plane to take off" if self.weather == "stormy"
  @planes.delete(plane)
end

def is_plane_present?(plane)
  @planes.include?(plane)
end

end
