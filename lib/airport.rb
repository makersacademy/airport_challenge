require_relative 'plane'
require_relative 'weather'

class Airport

	DEFAULT_CAPACITY = 10

	def initialize (capacity = DEFAULT_CAPACITY)
		@terminal = []
		@capacity = capacity
	end

	def land (plane)
		fail "It's too stormy to land a plane" if stormy?
		fail "The airport is already full" if full?
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
		 Weather.new.weather_generator
	end

	def full?
		@terminal.count >= @capacity 
	end


end