class Plane

    def initialize(name = 'Standard Airways Flight 3095')
        @name = name
    end

    def report_taken_off
        @departed = true
    end

    def departed?
        @departed
    end    
end
