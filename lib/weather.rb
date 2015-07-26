module Weather 
	def stormy?
		random = Random.rand(5)
		if random == 0
			true
		else 
			false 
		end 
	end 
end 
