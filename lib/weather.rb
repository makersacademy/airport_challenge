class Weather

	def stormy?
		outlook == :stormy
	end	

	def outlook
		[:stormy, :fine, :fine].sample
	end

end

