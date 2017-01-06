class Weather

	def generate_num
		rand(10)
	end

	def stormy?
		if generate_num == 1
			true
		else
			false
		end
	end

end