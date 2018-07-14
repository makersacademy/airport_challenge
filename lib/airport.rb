class Airport
	attr_accessor :weather
	
	def initialize(capacity)
		@capacity = capacity
		@planes = []
	end
	
	def land(plane)
		raise 'Cannot land: Weather is stormy' if stormy?
		raise 'Cannot land: Airport is full' if full?
		@planes << plane
	end

	def take_off(plane)
		raise 'Cannot take-off: Weather is stormy' if stormy?
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