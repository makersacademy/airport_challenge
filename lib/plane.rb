class Plane
    
    attr_accessor :flying
   def initialize 
        @flying = false
   end
   
   def take_off
       @flying = true
   end
end