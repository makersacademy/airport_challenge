class Airport 
    
    def initialize(capacity)
    @capacity = capacity
    @planes = []
    end
    
    def land(plane)
    raise 'Capacity is full : Cannot land plane' if capacity_full
    raise 'Weather is stormy : Cannot land plane' if stormy?

    @planes << plane
    end

    def take_off(plane)
    end

    private 

    def capacity_full
    if @planes.length >= @capacity
    true 
    else false
    end
    end

    def stormy?
    rand(1..6) > 4
    end

end