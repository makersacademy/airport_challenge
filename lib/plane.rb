class Plane
    def initialise(flying_or_not)
        @flightstatus = flying_or_not
    end
    
    def is_plane_flying?
        return "#{@flightstatus}"
    end
end