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

	def takeoff (plane)
		@terminal.reject! {|pl| pl == plane}
	end

	def left_airport? (plane)
		true unless @terminal.include? plane
	end
end