require_relative "plane"

class Airport

attr_reader :planes

def initialize
  @planes = []
end

def taxi(plane)
  fail "Too stormy to taxi plane" if !sunny?
  plane.landed = false
  planes.delete(plane)
end

end



def sunny?
  [true, false].sample
end
