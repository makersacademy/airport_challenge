require_relative 'weather'
require_relative 'airport'

class Plane

    def land
        @flying = false
        self
    end

    def take_off
        @flying = true
        self
    end
    
    def flying?
        @flying
    end

end