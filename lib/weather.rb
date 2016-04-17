class Weather
	
	def stormy?
  	random_outlook == :stormy
	end

private

	OUTLOOKS = [:stormy, :sunny, :sunny, :sunny]

	def random_outlook
		OUTLOOKS.sample
	end

end