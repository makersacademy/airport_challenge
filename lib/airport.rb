class Airport

attr_reader :plane
attr_accessor :capacity
attr_reader :forecast
DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
 		@hangar_report = []	
 		@capacity = DEFAULT_CAPACITY
 		@weather = [:sunny, :stormy]
	 	@forecast = @weather.sample
	end

	def land(plane)	
		fail 'Airport is full: cannot land right now.' if full?
     	hangar_report << plane
	end

	def take_off(plane)
        fail 'Weather is stormy, cannot take-off.' if stormy?
        hangar_report.pop
        return @hangar_report
	end


private 

attr_reader :hangar_report

	def full?
		hangar_report.count >= capacity
	end

	def stormy?
		forecast == :stormy
	end

end


# class Weather 

# attr_reader :forecast


# 	def initialize
		
# 	end

# 	def weather
# 	  	@weather = weather
# 	end

# end


class Plane

def plane
	@plane
end 

end

