
class Airport

attr_reader :planes

def initialize
@planes = []
end


def land_plane(plane)

  @planes << plane

end

end


class Plane

def initialize 

end

end