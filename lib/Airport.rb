require_relative 'Plane'

class Airport
    
    attr_accessor = :plane_list
    
    def initialize
        @plane_list = []
    end
   
    def park(n)
        if @plane_list.include? n
            return "#{n} is already parked at the airport"
        elsif n.plane_landed == true && n.plane_instructed_to_land == true
            return @plane_list << n
        end
        return "#{n} is yet to be instructed to land" if n.plane_instructed_to_land == false
        return "#{n} has been instructed to land but not yet landed" if n.plane_landed == false
    end
    
    def show_planes
       @plane_list.last
    end
    
    
end
