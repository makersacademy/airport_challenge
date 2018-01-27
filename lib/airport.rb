class Airport

def initialize
  @planes_collection = []
end

def land(plane)
  @planes_collection << plane
end

def take_off(plane)
  @planes_collection.delete(plane)
end

def confirm_take_off(plane)
  "#{plane} took off"
end

end
