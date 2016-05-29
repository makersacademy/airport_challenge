class Weather

	def stormy?
		if outlook == :stormy
			true
		end
	end	

	def outlook
		[:stormy, :fine, :fine].sample
	end

end

