class Plane 

    def land(airport)
      raise 'airport is full' if airport.full?  
      @airport = airport
      airport.hangar << self 
      
    end 
    def takeoff
        @airport.hangar.delete(self)
        @airport = nil
        'plane tookoff'
        
    end 
end 
