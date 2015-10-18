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
		# weather = stormy
		# fail "There is a storm" if weather == true
		@planes_array << plane
	end

	def take_off(plane)
		fail "The plane did not land on this airport" if !@planes_array.include?(plane)
		@planes_array.select { |i| i == plane }.pop
	end

	# def stormy
	# 	random = Random.new
	# 	num = random.rand(1..100)
	# 	num >= 95
	# end
end