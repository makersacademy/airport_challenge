class Airport
    
    attr_reader :current_capacity

    #MAXIMUM_CAPACITY = 100

    def initialize
        @current_capacity = 0
        @planes = []
    end 

    def land(plane)
        raise "Airport full, no planes allowed" if full?
        @planes << plane
    end 

    def take_off(plane)
        take_off_info
    end 

    def take_off_info
        "Plane have left the airport"
    end 

    private 

    def full?
        @planes.length >= 50

    end 

end 

