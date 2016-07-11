require 'weather'

class Plane
  def flying?
      
     #define as true after take-off
     #define as false after landing
     @flying
  end
    
   def landing
       @flying = false
   end
   
   def take_off
       @flying = true
   end
    
end