class Plane

    def initialize(landed=false)
        @landed = landed
    end

    def report_landing
        @landed = true
    end

    def landed?
        @landed 
    end
end