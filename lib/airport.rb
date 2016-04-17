require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 100
	def initialize(cap=DEFAULT_CAPACITY)
		@planes = []
		@stormy = false
		@capacity = cap
	end

	def accept(plane)
		raise "That plane has already landed at this airport!" if @planes.include?(plane)
		raise "The weather is too harsh for a safe landing, please circle back. Over." if stormy?
		raise "The airport is full! Circle until a plane has taken off. Over." if full?
		@planes << plane
		weather_update
	end

	def confirm_takeoff(plane)
		raise "No such plane is presently at the airport." unless @planes.include?(plane)
		raise "The weather is too harsh for a safe take-off!" if stormy?
		@planes.delete(plane)
		weather_update
	end

	def plane_status(plane)
		if @planes.include?(plane) && plane.landed?
			"Confirming that plane has landed."
		else
			"No such plane is presently at the airport."
		end
	end

	private

	def stormy?
		@stormy
	end

	def weather_update
		roll = rand(20)
		roll == 19 ? @stormy = true : @stormy = false
	end

	def full?
		@planes.length >= @capacity
	end
end