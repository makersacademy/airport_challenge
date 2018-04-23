class AirPort
    def initialize(landing_bays = [])
        @landing_bays = landing_bays
    end
    
    def land(p)
        @landing_bays.push(p)
    end
end