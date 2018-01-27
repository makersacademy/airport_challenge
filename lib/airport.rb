class Airport

def initialize
  @planes_collection = []
end

def land(plane)
  @planes_collection << plane
end

end
