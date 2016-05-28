class Weather

	def stormy?
		if rand(1..5) == 5
			true
		else
			false
		end
	end	
end