
class Airport

DEFAULT_CAPACITY = 50

attr_reader :capacity, :storage

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@storage = []
	end
end