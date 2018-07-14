class Airport
	attr_accessor :weather
	
	def initialize
		@weather = 'fine'
	end
	
	def land(plane)
		if @weather == 'stormy'
			raise 'Cannot land: Weather is stormy'
		end
	end
	def take_off(plane)
		if @weather == 'stormy'
			raise 'Cannot take-off: Weather is stormy'
		end
		puts "Take-off: Successful"
	end

end