class Airport
	attr_accessor :weather, :capacity, :planes
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@weather = weather
		@planes = []
	end
	
	def land(plane)
		raise 'Cannot land: Weather is stormy' if stormy?
		raise 'Cannot land: Airport is full' if full?
		@planes << plane
	end

	def take_off(plane)
		raise 'Cannot take-off: Weather is stormy' if stormy?
		@planes.delete(plane)
		puts "Take-off: Successful"
	end

	private
	def stormy?
		@weather == 'stormy'
	end
	def full?
		@planes.length >= @capacity
	end
end