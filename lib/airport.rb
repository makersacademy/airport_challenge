require_relative 'plane'

class Airport

	def initialize
		@terminal = []
	end

	def land (plane)
		fail "It's too stormy to land a plane" if stormy?
		@terminal << plane
	end

	def landed? (plane)
		@terminal.include? plane
	end

	def takeoff (plane)
		fail "It's too stormy to take off" if stormy?
		@terminal.reject! {|pl| pl == plane}
	end

	def left_airport? (plane)
		true unless @terminal.include? plane
	end

	private

	def stormy?
		 chance = rand(1..5)
		 chance == 1 
	end


end