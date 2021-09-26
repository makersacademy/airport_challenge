class Airport 
    def initialize(capacity)
      @capacity = capacity
      @stored_plane  = []
    
    end  
     

    def add_capacity
      @capacity += 1
    end   


    def land(plane)
      if @stored_plane.length < @capacity
        return @stored_plane.push(plane)
      else 
        return "Cannot land Airport is full"
      end   
        
        
    end   
    def take_off(plane)
      if @stored_plane.include?(plane)
        @stored_plane.delete(plane)
        return "Plane has taken off"
      end   
      
    end  

    def weather

    end   

      
end
