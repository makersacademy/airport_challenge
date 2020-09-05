#airport should resond to take off, land and should have a capacity
#cannot take in flights or let flights to take off if the weather is stormy

class Airport
attr_reader :airport_planes
    def initialize
    @airport_planes = []
    end 

def land_plane
    @airport_planes << @plane
end

def take_off
    raise "There are no planes!" if @airport_planes.length == 0
    @airport_planes.pop
end

end

