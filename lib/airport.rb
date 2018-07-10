class Airport
	attr_accessor :planes, :weather, :capacity
	def initialize(weather: "fine", capacity:5)
		@planes = []
		@weather = weather
		@capacity = capacity
	end
end