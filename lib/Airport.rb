require 'Plane'

class Airport

	attr_reader :weather, :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		raise "Invalid capacity" unless capacity.is_a? Integer
		@landed = []
		@weather = {sun: false, storm: false, rain: false, wind: 0}
		@capacity = capacity
	end

	def land(plane)
		plane_exist?(plane)
		raise ArgumentError, 'Plane already landed' if at_airport?(plane)
		safe_weather?
		full?
		@landed << {plane: plane, id: plane.id} 
	end

	def at_airport?(plane)
		there = false
		@landed.each {|hash| there = true if hash[:id]==plane.id}
		there
	end

	def weather_update(key, value)
		raise RuntimeError, 'Invalid weather type key' unless @weather.has_key?(key)
		if key == :wind
			raise ArgumentError, 'Invalid wind value' unless value.between?(0,5)
		else
			raise RuntimeError, 'Expecting boolean' unless !!value == value
		end
		@weather[key] = value
	end
	

	def takeoff(plane)
		plane_exist?(plane)
		raise ArgumentError, 'Plane not at this airport' unless at_airport?(plane)
		safe_weather?
		@landed.delete_if {|hash| hash[:id] == plane.id}
	end

	private

	def full?
		raise 'Airport full' if @landed.length >= @capacity
	end

	def plane_exist?(plane)
		raise ArgumentError, 'Not a valid plane object' unless plane.class == Plane
		raise ArgumentError, 'Plane does not exist' unless Plane.class_variable_get(:@@planes) >= plane.id
	end

	def safe_weather?
		raise 'Weather not safe enough' if weather[:storm] 
	end

end
