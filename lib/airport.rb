require_relative 'plane'

class Airport

    def initialize 
        @capacity = 3
        @planes = []
    end

    def take_off(plane)

    fail 'No planes available' if @planes.empty?
    @planes.pop
    puts "Plane has taken off"
            
    end

    def land(plane)
        raise "Airport full can't land here" if full
        @planes << plane
    end

    private
    def full
    if @planes.count >= @capacity
        true
    else 
        false
    end
end
end
    

