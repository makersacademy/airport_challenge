require './docs/plane.rb'
class Airport

def land(plane)
  plane
end

def confirm_land(plane)
  land(plane) == plane
end

end
