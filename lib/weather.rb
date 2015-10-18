class Weather

	def initialize
		@random_outlook = OUTLOOKS.sample
	end

	def stormy?
		@random_outlook == :stormy
	end
	
	private
	
	OUTLOOKS = [:stormy, :sunny, :sunny, :sunny]
end