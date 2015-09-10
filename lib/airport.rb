class Airport
	DEFAULT_CAPACITY = 10

	attr_reader :planes, :capacity

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def plane_landed plane
		planes << plane
	end

	def plane_taken_off plane
		planes.delete(plane) 
	end

	def land_permission
		fail 'Airport full' if full?
		fail 'Stormy weather' if weather == 'stormy'
	end

	def take_off_permission
		fail 'Stormy' if weather == 'stormy'
	end

	def full?
		planes.length >= capacity ? true : false 
	end

	def weather
		rand(0..1) == 0 ? 'sunny' : 'stormy'
	end
end
