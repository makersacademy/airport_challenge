class Airport 
    def initialize(capacity)
      @capacity = capacity
      @stored_plane  = []
     
    end  
     

    def add_capacity
      @capacity += 1
    end   


    def land(plane)
      @plane = plane
      weather

      if @weather == 1 
        return "Weather is stormy: do not land"
      elsif @weather == 2 || @weather == 3
        if @stored_plane.length < @capacity
          return @stored_plane.push(@plane)
        else
          return "Cannot land Airport is full" 
        end   
      end         
      
     
    end     

        
    def take_off(plane)
      weather 
      if @weather == 1 
        return "Weather is stormy: do not take off"
      elsif @weather == 2 || @weather == 3
        @stored_plane.include?(plane)
          @stored_plane.delete(plane)
          return "Plane has taken off"
        end   
      
    end  

      

    def weather
      @weather = rand(1..3)
      
    end     
end
