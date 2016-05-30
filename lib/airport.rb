#Airport Challenge: Airport Class

require_relative 'plane'
require_relative 'weather'

class Airport 

	attr_reader :terminal
	attr_reader :weather
	attr_accessor :capacity
	DEFAULT_CAPACITY = 50

	def initialize(capacity = DEFAULT_CAPACITY)
		@terminal = []
		@capacity = capacity

	end

	#Land method for incoming planes:

	def land(plane)
		weather = Weather.new
		fail "ERROR: Weather Is Not Good Enough To Land" if bad_weather? == true
		fail "ERROR: Airport is full" if full?
		@terminal << plane
	end	

	#Check plane has landed:

	def landed?(plane)
		if @terminal.include? plane
			return true 
		else 
			return false
		end
	end 

	#Check plane has taken off:

	def taken_off?(plane)
		if @terminal.include? plane
			return false 
		else 
			return true
		end
	end

	#Take off method for outgoing planes:

	def take_off(plane)
		@terminal.delete(plane)
	end

	private 

	#Maximum capacity reached:

	def full? 
		@terminal.count >= capacity
	end

	#Check for bad weather:

	def bad_weather?
	 	Weather.new.forecast?
	end
end


