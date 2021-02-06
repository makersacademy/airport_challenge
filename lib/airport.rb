class Airport

attr_reader :hangar_report 
attr_reader :plane

	def initialize
 		@hangar_report = []	
	end

	def land(plane)	
		fail 'Airport is full: cannot land right now.' if @hangar_report.count == 1
     	@hangar_report << plane
	end

	def take_off(plane)
        @hangar_report.pop
        return @hangar_report
	end

end


class Plane

 
end