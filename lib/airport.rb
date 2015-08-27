require_relative "plane"


class Airport

DEFAULT_CAPACITY = 10

attr_reader :capacity

def initialize
	@airport_capacity = []
	@capacity = DEFAULT_CAPACITY
	@weather = "sunny"
end

	def land plane
		fail "unable to land when stormy" if @weather == "stormy"
		fail 'airport full' if @airport_capacity.length >= DEFAULT_CAPACITY
		@airport_capacity << plane
	end
	def empty?
		@airport_capacity.empty?
	end
	def take_off
		fail "unable to take-off when stormy" if @weather == "stormy"
		@airport_capacity.pop
	end
	def change_weather(n)
		if n <= 5 
			@weather = "sunny"
		else
			@weather = "stormy"
		end
	end
end
