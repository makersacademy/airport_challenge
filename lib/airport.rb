class Airport


attr_reader :hangar

def initialize
  @hangar = []
end

def add_plane(plane)
  @hangar.push(plane)
end

end
