require_relative 'plane'

class Airport

	#attr_accessor :planes

	DEFAULT_CAPACITY = 10

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def is_stormy?
		rand(0..1) == 0 ? true : false
	end

	def is_full?
		@planes.length >= @capacity ? true : false 
	end

	def instruct_land plane
		fail 'Not a plane' unless plane.is_a?(Plane)
		plane.land self
		@planes << plane
	end

	def instruct_takeoff plane
		fail 'Not a plane' unless plane.is_a?(Plane)
		fail 'The plane is currently not at this airport' unless has_plane?(plane)
		plane.take_off
	end

	private

	def has_plane? plane
		@planes.include?(plane)
	end

end

########################

# require './lib/plane.rb'

# class Airport

# attr_reader :capacity, :planes

# DEFAULT_CAPACITY = 10

#  def initialize
#    @planes = []
#    @capacity = DEFAULT_CAPACITY
#  end

#  def release_plane
#    return false if empty? || stormy?
#    @planes.pop
#  end

#  def dock(plane)
#    fail 'Airport unavailable' if full? || stormy?
#    @planes << plane
#  end

#  private

#  def full?
#    @planes.count >= DEFAULT_CAPACITY
#  end

#  def empty?
#    @planes.empty?
#  end

#  def stormy?
#    forcast = rand(1..30)
#    forcast < 15 ? true : false
#  end

# end



#######################




# class Plane
# end

# airport1 = Airport.new
# p1 = Plane.new
# p2 = Plane.new
# p3 = Plane.new
# airport1.planes << p1
# airport1.planes << p2
# p airport1.planes.include?(p2)
# p airport1.planes.include?(p3)






