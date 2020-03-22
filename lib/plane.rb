require_relative 'airport'
class Plane 
attr_reader :present

def initialize (present = true)
    @present = present
end

def land_plane
    @present = true 
end

def take_off
    @present = false
end
    
def can_i_land (response)
    response
end

end