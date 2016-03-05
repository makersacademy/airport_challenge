require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

#require_relative 'container'

attr_reader :capacity, :storage

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@storage = []
	end

	def full?
		storage.length>=capacity 
	end

	def in_airport?(plane)
		storage.include?(plane)
	end

# 	def airport_open?
# 		weather = random_weather
# 	 	weather == "Sunny"
# 	end

# #private

# 	def announcement
# 		"Due to stormy weather, this airport is closed" if airport_open? == false
# 	end

end

