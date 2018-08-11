class Plane 

attr_reader :grounded

    def initialize(grounded = true)
        @grounded = grounded
    end

    def grounded?
        @grounded
    end


end
