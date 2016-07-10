module Weather

	def Weather.good_forecast?
		# true ratio is 0.7 (often true)
		rand < 0.7
	end

end 