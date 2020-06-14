class Plane
    def land(airport)
        if airport.full?
          fail 'airport is full'
        else 
          airport.landed_plane = self #is the subject that we use in the spec files.
        end 
    end 
    
    def takeoff(airport)
        airport.landed_plane = nil
    end 
end 