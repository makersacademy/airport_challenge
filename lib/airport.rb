class Airport

attr_reader :plane
attr_accessor :capacity
DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
 		@hangar_report = []	
 		@capacity = DEFAULT_CAPACITY
	end

	def land(plane)	
		fail 'Airport is full: cannot land right now.' if full?
     	hangar_report << plane
	end

	def take_off(plane)
        hangar_report.pop
        return @hangar_report
	end


private 

attr_reader :hangar_report

	def full?
		hangar_report.count >= capacity
	end

end


class Weather 

	def stormy?

	end

end




class Plane

 
end