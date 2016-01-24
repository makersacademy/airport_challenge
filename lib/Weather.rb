require 'Airport'

module Weather

	def sunny?
		rand(10) > 3
	end

	def stormy?
		!sunny?
	end

end 


