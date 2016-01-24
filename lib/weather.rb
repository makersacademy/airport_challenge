class Weather

@weather = true

	def weather?
		x = rand(10)
		if x > 8 then weather false else true end
	end
end
