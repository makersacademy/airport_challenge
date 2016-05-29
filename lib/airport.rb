#Airport Challenge: Airport Class

require_relative 'plane'
require_relative 'weather'

class Airport 

	attr_reader :terminal
	attr_accessor :capacity
	DEFAULT_CAPACITY = 50

	def initialize(capacity = DEFAULT_CAPACITY)
		@terminal = []
		@capacity = capacity

	end

	def land(plane)
		#fail "ERROR: Weather Is Not Good Enough To Land" if #WEATHER = "Bad Weather"
		fail "ERROR: Airport is full" if full?
		terminal << plane
	end

		#p "#{plane} has landed"
	

	def landed?(plane)
		if @terminal.include? plane
			return true 
		else 
			return false
		end
	end 

	def taken_off?(plane)
		if @terminal.include? plane
			return false 
		else 
			return true
		end
	end

	def take_off(plane)
		@terminal.delete(plane)
	end

	private 

	def full? 
		terminal.count >= capacity
	end

	#def weather 
	#create a random number generator which outputs a number between 1 and 5 (or so) 
	#which outputs different weather scenarios depending on the number generated.
	#this will cause tests to fail at times as the weather won't allow planes to land. This is where the stub comes which allows certain things to be true. 
	#You can then force the weather to be a 1 (stormy) and check the result....
	#GOOGLE THE 'ALLOW' STUB!!!!!


end


