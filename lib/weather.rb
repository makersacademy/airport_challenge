class Weather

	attr_reader :stormy

	def stormy?
		@stormy = true if rand(2) == 1
	end

end