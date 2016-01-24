class Plane
    
    attr_reader :plane_landed, :plane_instructed_to_land
    
    
    
    def initialize
        @plane_landed = false
        @plane_instructed_to_land = false
    end
    
    def instruct_to_land
       @plane_instructed_to_land = true 
    end
    
    def has_landed
       @plane_landed = true
    end
    
    #def plane_state(n)
     #   @planes_currently << n
    #end
    
    

end



