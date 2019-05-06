class Airport 
    def initialize
        @airport_array = []   
        @CAPACITY = 5     
    end

    def land_plane(plane, weather)
        fail 'cannot land plane, capacity exceeded' if full?
        if weather == "sunny"
            @airport_array << plane
        end
    end

    def take_off_plane(plane, weather)
        if weather == "sunny"
            @airport_array.delete(plane)
        end
    end

    attr_reader :airport_array, :CAPACITY
   
    private
    def full?
        @airport_array.length >= @CAPACITY ? true : false
    end

end