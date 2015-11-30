require 'weather_report.rb'

class Airport
	DEFAULT_CAPACITY = 20

	attr_reader :planes

	def initialize(weather_report, capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
		@weather_report = weather_report
	end

	def land(plane)
		raise 'Cannot land plane: airport full' if full?
		raise 'Cannot land plane: weather is stormy' if stormy?
		plane.land(self)
		add_plane(plane)
	end

	def take_off(plane)
		raise 'Plane cannot take off: weather is stormy' if stormy?
		raise 'Cannot take off plane: plane is not at this airport' unless at_airport?(plane)
		plane.take_off
		remove_plane(plane)
		plane
	end

	private

	attr_reader :capacity, :weather_report

	def full?
		planes.length >= capacity
	end

	def stormy?
		weather_report.stormy?
	end

	def at_airport?(plane)
		planes.include?(plane)
	end

	def add_plane(plane)
		planes << plane
	end

	def remove_plane(plane)
		planes.pop
	end

end





# class Airport
#
#   def initialize(capacity)
#     @capacity = capacity
#     @planes = []
#   end
#
#   def land(plane)
#     raise 'Cannot land plane: airport is full' if full?
#     @planes << plane
#   end
#
#   def take_off(plane)
#   end
#
#   private
#
#   def full?
#     @planes.length >= @capacity
#   end
#
# end




# require_relative "plane.rb"
#
# class Airport
#   DEFAULT_CAPACITY = 20
#
#   attr_reader :planes, :capacity
#
#   def initialize (capacity = DEFAULT_CAPACITY)
#     stormy?
#     @capacity = (capacity)
#     @planes = []
#   end
#
#   def land(plane)
#     raise "Sorry mate- storm's a brewin" if stormy
#     raise "Sorry mate- this airport is full..." if full?
#     @planes << plane
#   end
#
#   def take_off(plane)
#     raise "Sorry mate- storm's a brewin" if stormy
#     @planes.delete(plane)
#   end
#
#   private
#
#   def full?
#     true if @planes.length >= @capacity
#   end
#
#   def stormy?
#     if rand(9) < 2
#       @stormy = true
#     else
#        @stormy = false
#     end
#   end
#
# end
