class Airport
	DEFAULT_CAPACITY = 20

	attr_reader :landed_planes, :capacity 
	attr_accessor :weather, :chance_of_storm

	def initialize(capacity=DEFAULT_CAPACITY,weather = "clear")
		@landed_planes = []
		@capacity = capacity
		@weather = weather
		@chance_of_storm = rand(10)
	end

	def stormy
		if @chance_of_storm == 10 then @weather = "stormy" end
	end
end

