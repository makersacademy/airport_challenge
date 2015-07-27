require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 2

 attr_reader :location

 attr_accessor :capacity

	def initialize (location, capacity = DEFAULT_CAPACITY)
		@airport = []
		@location = location
		@capacity = capacity.to_i
	end

	def airport 
		@airport
	end

	def inst_take_off
	end

	def release_plane plane
		raise 'the weather does not allow to take off' if weather?
		raise 'wrong location we cannot release this plane' if self.location != plane.destination
		@airport.delete(plane)
		plane.can_take_off
		puts "Enter new destination:"
		plane.destination = gets.chomp
	end

	def weather? 
	arr = ["sunny", "stormy"]
	return arr[rand(2)] == "stormy"	
	end

	def inst_landing 
	end

	def receive_plane plane
		raise 'the weather does not allow to land' if weather?
		raise 'wrong location we cannot accept this plane' if self.location != plane.destination
		raise 'airport is full' if full?
		plane.can_land
		@airport.push plane
	end

	def full?
		self.airport.size >= capacity
	end

end
