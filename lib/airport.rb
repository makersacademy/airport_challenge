require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 10

	def initialize(capacity = DEFAULT_CAPACITY)
		@weather = Weather.new
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		raise "Airport is full" if full?
		raise "You cannot land during stormy weather" if stormy?	
		plane.land
		planes << plane
		"#{plane} has landed"
	end

	def take_off(plane)
	  raise "There are no planes at this airport" if empty?
		raise "You cannot take off during stormy weather" if stormy?
		plane.take_off
		planes.delete(plane)
		"#{ plane } has taken off and left the airport"
	end

	private
	attr_reader :weather, :capacity, :planes

  def full?
    planes.length >= capacity
  end

  def empty?
  	planes.length == 0
  end

  def stormy?
  	weather.stormy?
  end

end