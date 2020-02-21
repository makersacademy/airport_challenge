class Airport
	DEFAULT_CAPACITY = 1

	def initialize
		@capacity = DEFAULT_CAPACITY
	end

	def change_capacity(num)
		@capacity = num
	end

	def land(plane)
		fail 'this airport is full!' if @plane
		@plane = plane
	end

	def take_off(plane)
		'The plane has taken off and is no longer in the airport'
	end
end

class Plane

end

class Weather
	def initialize
		@weather = ['sunny', 'stormy']
	end
end
