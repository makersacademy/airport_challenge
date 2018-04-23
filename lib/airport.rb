class AirPort
    attr_reader :landing_bays
    
    def initialize(landing_bays = [])
        @landing_bays = landing_bays
    end
    
    def land(p)
        @landing_bays.push(p)
    end
    
    def takeoff(p)
        "#{p} no longer in airport"
    end
end