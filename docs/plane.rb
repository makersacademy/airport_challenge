class Plane

    attr_reader :planes_landed
  
    def intialize(plane)
        @planes_landed 
    end 

    def report_if_taken_off
        @departed = true
    end

    def departed?(plane)
        @departed
    end
end 