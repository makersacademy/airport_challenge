class Airport 
    def initialize(capacity)
        @capacity = capacity
        @planes = []
    end 

    def land(plane)
        fail 'Airport is full, cannot land the plane' if @planes.length >= @capacity
        # put the plane that just landed into the planes array (@planes)
        @planes << plane
    end 

    def take_off(plane)
    end 
end 