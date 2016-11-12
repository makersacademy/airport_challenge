module Weather

	def stormy?
		return true if random_number == 0
		return false
	end

	private

	def random_number
		rand(5)
	end

end