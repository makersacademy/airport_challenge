#Class Weather
class Weather
	def initialize
		@storm = false
	end
	def stormy?(status = true)
		@storm = status
	end
end

# Class to know the status of the aircraft and airport
class Airport < Weather
	def initialize()
		@hangar = []
	end

	DEFAULT_CAPACITY = 20
	
	def full?
		@full = true
	end

	def land
		# fail 'You can not land the aircraft because the airport is full' if @full == true
		fail 'You can not land the aircraft because of the storm' if @storm == true
		@hangar << +1
		@hangar.count
	end

	def take_off
		fail 'You can not take off the aircraft because of the storm' if @storm == true
		@hangar.pop
		@hangar
	end
end