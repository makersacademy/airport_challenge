class Plane
    attr_reader :name, :status, :airport
    @@planes = []

    def self.planes
        @@planes
    end

    def initialize()
        @name = auto_name
        @status = "queueing to land"
        @airport = nil
        @@planes << self
    end

    def land(airport)
        @status = "land"
        @airport = airport
    end

    def take_off
        @status = "take off"
        @airport = nil
    end

    private
    def auto_name
        "Explorer #{@@planes.count + 1}"
    end
end