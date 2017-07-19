require 'airport.rb'
class Plane
   
   def initialize
    @is_it_landed = false
   end
   
   attr_reader :is_it_landed
   
   def the_airplane_has_landed_or_taken_off
       @is_it_landed ^= true
   end
   
   def landed?
       if @is_it_landed == true
           "Refuling and loading passengers"
       else
           "Berlin Air flight 302 reporting from above the clouds"
       end
   end
end