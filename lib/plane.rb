class Plane
    attr_reader :status
    def initialize
        @status = "stock"
    end
    def land(airport)
        @status = airport
    end
    def fly
        @status = "flying"
    end
end