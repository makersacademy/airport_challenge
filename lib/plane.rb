require_relative 'airport'

class Plane
    
    def landed?(airport)
        if airport.hangar.include? self
            true
        else
            false
        end
    end
    
end