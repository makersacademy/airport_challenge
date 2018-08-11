class Plane 

attr_reader :flying

    def initialize(flying = false)
        @flying = flying
    end

    def flying?
        @flying
    end

    def fly 
        @flying = true 
    end

end
