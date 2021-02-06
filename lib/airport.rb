class Airport

#attr_reader :plane 

	def initialize
 		@hangar_report = []	
	end

	def land(plane)	
     	@hangar_report << plane
	end

	def take_off
        @hangar_report.pop
        # puts "#{plane} has taken off!"
	end

end


class Plane

end