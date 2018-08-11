class Plane 

attr_reader :flying, :grounded

    def initialize(flying = false, grounded = true)
        @grounded = grounded  
        @flying = flying
    end

    def flying?
        @flying
    end

    def grounded?
        @grounded
    end

    def fly 
        @flying = true 
    end

    def land
        @grounded = true
    end

end
