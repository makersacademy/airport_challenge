class Airport

	attr_reader :landing, :taking_off
	DEFAULT_CAPACTIY = 20

	def initialize(capacity = DEFAULT_CAPACTIY)
		@landing = []
		@taking_off = []
		@capacity = capacity
		stormy = Weather.new.stormy?
	end

	def land(plane)
		raise "It's too stormy! The plane can't land now!" if stormy?
		raise "Sorry the plane can't land here, this airport is full!" if full?
		@landing << plane
	end

	def take_off
		raise "It's too stormy! The plane can't take off now!" if stormy?
		@taking_off << @landing.pop
	end

	def full?
		 @landing.size >= @capacity
	end

end

class Plane

end

class Weather

	def stormy?
		rand(10) > 8 ? true : false
	end

end