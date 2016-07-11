require 'plane'

class Airport
     attr_accessor :plane
     
     def initialize
         @plane =[]
     end
     
    # def initialize
    #     @planes = []
    # end
    
    
            #set this as a default?
        #whole class required for this?
        
    def parked(plane)
        if plane.landing == false
        @plane << plane
    end
    
    def left(plane)
        if plane.take_off == true
            @plane.pop
        end
    end
end
    #runway

    
    
    
    
end