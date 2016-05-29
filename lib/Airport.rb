require_relative 'Plane'
require_relative 'Weather'

class Airport
	attr_reader :terminal

	DEFAULT_CAPACITY = 10

	def initialize(capacity = DEFAULT_CAPACITY)
		@terminal = []
		@capacity = capacity
	end

	def incoming_plane(plane, weather = Weather.new.state)
		raise "Cannot land! Airport full!" if full?
		raise "Cannot land! Too stormy!" if weather == "stormy"
		plane.land
		@terminal << plane if (!full? && weather == "sunny")
		"Terminal:#{@terminal}"
	end

	def departing_plane(plane, weather = Weather.new.state)
		raise "Cannot take off! Too stormy!" if weather == "stormy"
		plane.take_off
		@terminal.delete(plane)
		"#{plane} is taking off!"
	end

	private
	
	def full?
		true if @terminal.length >= @capacity
	end

end