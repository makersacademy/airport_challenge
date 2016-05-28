class Weather

	def stormy
		random == :storm
	end

	outlook = [:fine, :fine, :fine, :storm]

	def random(outlook)
		outlook.sample
	end

end