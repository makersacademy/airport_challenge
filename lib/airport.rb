#airport should resond to take off, land and should have a capacity
#cannot take in flights or let flights to take off if the weather is stormy

class Airport
attr_reader :airport_planes, :capacity

    def initialize (capacity = 1)
    @capacity = capacity
    @airport_planes = []
    end 

def land(plane)
    raise "The airport is full" if @airport_planes.length >= @capacity
    plane.land
    @airport_planes << @plane
end

def take_off(plane)
    raise "There are no planes!" if @airport_planes.length.zero?
    plane.take_off
end

end

