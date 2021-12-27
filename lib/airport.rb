class Airport 
    def initialize(capacity)
        @capacity = capacity
        @planes = []
    end 

    def land(plane)
        fail 'Airport is full, cannot land the plane' if full?
        # put the plane that just landed into the planes array (@planes)
        @planes << plane
    end 

    def take_off(plane)
    end 

    private

    def full?
        @planes.length >= @capacity
    end 
end 