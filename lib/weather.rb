class Weather

	def initialize
		@stormy = false
		@stormy = true if rand(1..10) == 5
	end
	

	def stormy?
		@stormy

	end

end