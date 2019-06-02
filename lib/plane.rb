class Plane
    attr_accessor :status
    def initialize
        @status = "GROUNDED"
    end

    def land
        if @status == "IN-AIR"
            puts "Plane landed"
            @status = "GROUNDED"
            return self
        else
            raise "Plane is already grounded"
        end
    end

    def takeoff
        if  @status == "GROUNDED"
            puts  "Plane is in the air"
            @status = "IN-AIR"
            return self
        elsif @status == "IN-AIR"
            raise "Plane is already airbourne"
        end
    end
end