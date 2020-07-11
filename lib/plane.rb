require_relative 'airport'

class Plane

    def initialize(status=false)
        @flying = status
    end

    def flying
        @flying = true
        self
    end

    def landed
        @flying = false
        self
    end

    def flying?
        @flying
    end
    
end

