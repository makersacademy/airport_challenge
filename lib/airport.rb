class Airport

attr_reader :hangar_report 
attr_reader :plane
DEFAULT_CAPACITY = 20

	def initialize
 		@hangar_report = []	
	end

	def land(plane)	
		fail 'Airport is full: cannot land right now.' if full?
     	@hangar_report << plane
	end

	def take_off(plane)
        @hangar_report.pop
        return @hangar_report
	end


	private 

	def full?
		@hangar_report.count >= DEFAULT_CAPACITY
	end

end


class Plane

 
end