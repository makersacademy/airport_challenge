#airport should resond to take off, land and should have a capacity
#cannot take in flights or let flights to take off if the weather is stormy
require "plane"
require "weather"
class Airport
attr_reader :airport_planes, :capacity

CAPACITY =  4

    def initialize 
    @capacity = CAPACITY
    @airport_planes = []
    end 

def land(plane)
    raise "The airport is full" if full?
    plane.land
    @airport_planes << @plane
end

def take_off(plane)
    raise "There are no planes!" if empty?
    plane.take_off
end

def full?
    @airport_planes.length >= CAPACITY 
end 

def empty?
    @airport_planes.length.zero?
end 

end

