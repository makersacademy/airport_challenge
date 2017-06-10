require './docs/plane.rb'
class Airport

attr_accessor :planes

def initialize
  @planes = []
end

def land(plane)
  @planes << plane
end

def confirm_land(plane)
  @planes.include?(plane)
end

def take_off(plane)
  @planes.pop
end

def confirm_take_off(plane)
  !@planes.include?(plane)
end

end
