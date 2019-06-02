class Plane
    attr_accessor :status
    def initialize
        @status = :grounded
    end

    def land
        if @status == :airbourne
            puts "Plane landed"
            @status = :grounded
            return self
        else
            raise "Plane is already grounded"
        end
    end

    def takeoff
        if  @status == :grounded
            puts  "Plane is in the air"
            @status = :airbourne
            return self
        elsif @status == :airbourne
            raise "Plane is already airbourne"
        end
    end
end