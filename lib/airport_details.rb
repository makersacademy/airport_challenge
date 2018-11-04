#Class Weather
class Weather
	def initialize
		@@storm = false
	end
	def stormy?
		@@storm = true
	end
end

# Class to know the status of the aircraft
class Status < Weather

	def full?
		@full = true
	end

	def land
		fail 'You can not land the aircraft because the airport is full' if @full == true
		fail 'You can not land the aircraft because of the storm' if @@storm == true
		@land = true
	end

	def take_off
		fail 'You can not take off the aircraft because of the storm' if @@storm == true
		@take_of = true
	end
end