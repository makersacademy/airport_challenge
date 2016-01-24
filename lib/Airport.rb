require_relative 'Plane'

class Airport < Plane
    
    attr_accessor = :plane_list
    
    def initialize
        @plane_list = []
    end
   
    def whos_in_airport(n)
        if @plane_list.empty?
            fail "All planes are airborne"
        end
    end
   
    def park(n)
        if plane_to_land == true && confirm_landed == true
            @plane_list << n
        elsif plane_to_land == false
            fail "This plane is yet to be called to land"
        elsif confirm_landed == false
            fail "This plane has not landed"
        end
        
    end
    
end
