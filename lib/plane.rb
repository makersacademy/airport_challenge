class Plane
    attr_accessor :weather
    def initialize
        @weather = "POOR"
    end 
    def land
        if @weather == "POOR"
            raise "Conditions are unfavourable"
        else
            return "Plane landed"
        end
    end

    def takeoff
        if @weather == "POOR"
            raise "Conditions are unfavourable"
        else 
            return "Plane is in the air"
        end
    end
end