require_relative 'plane'

class Airport

	def initialize
		@terminal = []
	end

	def land (plane)
		@terminal << plane
	end

	def landed? (plane)
		@terminal.include? plane
	end


end