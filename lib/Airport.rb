require_relative 'plane'
require_relative 'weather'

class Airport

	attr_reader :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@available_space = capacity
		@terminal = []
	end

	def land(plane)
		fail "This plane has already landed!" if plane.status == "landed"
		fail "The airport is full!" if @available_space == 0
		fail "Stormy weather, cannot land plane" if check_weather == "stormy"
		@terminal << plane
		@available_space -= 1
		plane.set_landed(self)
		"landed plane: #{plane}"
	end

	def takeoff(plane)
		fail "This plane is already airborne!" if plane.status == "airborne"
		fail "Stormy weather, cannot takeoff" if check_weather == "stormy"
		fail "No planes in the terminal" if @capacity == @available_space
		@terminal.delete(plane)
		@available_space += 1
		plane.set_airborne
		"plane taken off"
	end

	def check_weather
		weather = Weather.new
		weather.status
	end

		private

		DEFAULT_CAPACITY = 10

		attr_reader :available_space

end