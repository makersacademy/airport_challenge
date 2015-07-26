require_relative 'plane'

class Airport
	
	DEFAULT_CAPACITY = 15

	attr_reader :capacity

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
		@location = location
	end

	def location
		['London', 'New York'].sample
	end

	def release_plane
		fail 'Airport is empty, no planes available' if empty?
		fail 'Weather is too stormy to take off' if stormy?
		puts "Your plane has taken off!"
		plane = @planes.pop
		plane.take_off
	end

	def land_plane (plane)
		# puts "Where would you like to land? London, New York or Tokyo?"
		# destination = @destination
		fail 'Airport is full, plane cannot land' if full?
		fail 'Weather is too stormy to land' if stormy?
		fail 'Oops, wrong airport, turn around!' if wrong_destination?(plane)
		puts "Your plane has landed!"
		@planes << plane
		plane.land
	end

	def wrong_destination? (plane)
		self.location != plane.destination
	end


private

	def empty?
		@planes.empty?
	end

	def full?
		@planes.size >= capacity
	end

	def stormy?
		true if rand(5) == 2
	end

end
