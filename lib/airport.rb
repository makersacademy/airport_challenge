require_relative 'plane'

class Airport

	attr_reader :plane, :capacity

	def allow_takeoff
      Plane.new
	end

	def allow_landing(plane)
		 
        raise "Airport is full, cannot allow plane to land" if Airport.new.full?   
        @plane = plane
    end

    def full?
    	true
    end
    
end