class Airport
    
attr_accessor :landed_plane
    def initialize 
        @landed_plane = nil
    end 
    
    def full?
        if @landed_plane == nil
          false
        else
          true
        end 
    end 
end


#def full?
#landed_plane != nil
#end 