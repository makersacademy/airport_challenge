require_relative 'weather'
require_relative 'airport'

class Plane

    def landed
        @flying = false
        self
    end

    def taken_off
        @flying = true
        self
    end
    
    def flying?
        @flying
    end

end