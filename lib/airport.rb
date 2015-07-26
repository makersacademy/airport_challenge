require_relative 'plane' #This has to be substituted by doubles

class Airport

	attr_accessor :capacity

	#The following lines of code initialize the values needed to define the capacity of the airport
	
	DEFAULT_CAPACITY = 1

	#Objects from the class plane needed. To be substituted with doubles.
	def initialize 
	plane = Plane.new
	@planes = [] 
	@capacity = capacity
	end

	#Method to define the default and constumized capacity of an airport
	def capacity (capacity=DEFAULT_CAPACITY)
		@capacity = capacity
	end


	#The following method let a plane to land on an airport. 
	#The status of the plane changes from flying to not flying.
	#One plane is added to the airport.
	#If the plane already landed the method can not be called again over the same plane.
	def landing (plane)
		fail 'This plane has already landed' if plane.flying? == false
		fail 'The airport is full. No landings are possible.' if full?
		plane = plane.landed?
		@planes << plane
		return 'Your flight has landed'

	end

	#The following method let a plane to take off from an airport.
	#The status of the plane changes from not flying to flying.
	#One plane is substracted from the airport.
	#If the plane already took off, the method can not be called again over the same plane.
	def take_off (plane)
		fail 'This plane has already departed' if plane.flying? == true
		plane = plane.departed?
		@planes[@planes.size - 1] = true
		@planes.delete(true)
		return 'Your flight has departed'
	end



	private

	attr_reader :bikes

	def full?
		@planes.size >= capacity
	end


end
