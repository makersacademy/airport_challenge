class Airport
	attr_accessor :weather
	
	def initialize
		
	end
	
	def land(plane)
		raise 'Cannot land: Weather is stormy' if stormy?
	end
	def take_off(plane)
		raise 'Cannot take-off: Weather is stormy' if stormy?
		puts "Take-off: Successful"
	end
	private
	def stormy?
		@weather == 'stormy'
	end
end