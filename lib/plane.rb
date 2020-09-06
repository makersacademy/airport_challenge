class Plane

    DEFAULT_FLYING_STATUS = false

    def initialize(flying_status = DEFAULT_FLYING_STATUS)
        @flying_status = flying_status
    end

    def takeoff
        raise "Plane is already flying" if @flying_status == true
        #flying status true
        @flying_status = true
    end

    def land 
        raise "Plane is already landed" if @flying_status == false
        #flying status false
        @flying_status = true
    end

    def flying?
        @flying_status
    end

end