require_relative './number_generator.rb'

class Airport
	attr_accessor :capacity, :planes, :is_stormy
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
		@is_stormy = false
	end

	def fly_plane(plane)
		if !has_plane?(plane)
			raise StandardError, "This plane is not at the airport"
		elsif @is_stormy
			raise StandardError, "Too stormy to take off"
		else 
			plane.takes_off
			@planes.delete_if { |landed_plane| landed_plane == plane }
			"Plane #{plane} has taken off"
		end
	end

	def land_plane(plane)
		if is_full?
			raise StandardError, 'No parking space available'
		elsif @is_stormy 
			raise StandardError, 'Too stormy to land'
		else
		  @planes << plane 
		end
	end

	def is_stormy? 
		number_generator = NumberGenerator.new
		current_weather = number_generator.biubiubiu
		(current_weather == 'stormy') ? @is_stormy = true : @is_stormy = false
	end

	private 
	def is_full?
		true if @planes.length == DEFAULT_CAPACITY
	end
	def has_plane?(plane)
		true if @planes.include? plane
	end
end
