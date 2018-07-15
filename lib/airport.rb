require_relative 'weather.rb'
class Airport
	attr_accessor :capacity, :weather, :landed, :flying
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
		@capacity = capacity
		@weather = weather
		@landed = []
		@flying = []
	end
	
	def land(plane)
		raise 'Cannot land: Weather is stormy' if stormy?
		raise 'Cannot land: Airport is full' if full?
		raise 'Cannot land: Already landed' if @landed.include?(plane)
		@landed << plane
		@flying.delete(plane)
	end

	def take_off(plane)
		raise 'Cannot take-off: Weather is stormy' if stormy?
		raise 'Cannot take-off: Not at this airport' unless @landed.include?(plane) 
		@flying << plane
		@landed.delete(plane)
		puts "Take-off: Successful"
	end

	private

	def stormy?
		weather.stormy?
	end

	def full?
		@landed.length >= capacity
	end
end