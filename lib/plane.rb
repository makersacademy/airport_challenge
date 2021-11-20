class Plane
    attr_reader :name, :flying
    
    def initialize(name="N/A",flying=false)
        @name = name
        @flying = flying
    end
    
    def report_flying
        @flying = true
    end
    
    def report_landed
        @flying = false
    end
    
    def flying?
        @flying
    end

end    
