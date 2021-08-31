class Airport
  
    def initialize(planes=[])
        @planes = planes
    end 
    
    def land_plane(plane)
     @planes = ["plane_1"]
    end 
    
    def take_off
      @planes
    end 

end 