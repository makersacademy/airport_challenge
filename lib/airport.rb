require_relative 'plane'

class Airport
	attr_reader :capacity, :planes_array
	DEFAULT_CAPACITY = 50

	
	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@planes_array = [] # we can hold 50 planes in this array	
	end

	def land(plane)
		fail "The airport is full" if @planes_array.length >= capacity
		fail "There is a storm" if stormy
		plane.landed
		@planes_array << plane
	end

	def take_off(plane)
		fail "The plane did not land on this airport" if !@planes_array.include?(plane)
		fail "A flying plane cannot take off" if plane.flying
		plane.fly
		@planes_array.select { |i| i == plane }.pop
	end

	def stormy
		random = Random.new
		num = random.rand(1..100)
		num >= 95
	end
end

#  p plane = Plane.new

#  p airport = Airport.new(20)

#  p airport.land(plane)

#  p airport.take_off(plane)


# p airport.stormy