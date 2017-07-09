class Airport

attr_accessor :planes

def initialize
  @planes = []
end

def land_plane
  planes << Plane.new
end

def airport_has_plane?
  planes == [] ? false : true
end

end
