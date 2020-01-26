class Plane
    attr_reader :airport
    def initialize(airport = true)
        @airport = airport
    end

    def landed?
        @airport
    end
end
