require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 10

	def initialize
		@weather = Weather.new
		@planes = []
	end

	def land(plane)
		raise "Airport is full" if full?
		planes << plane
		"#{plane} has landed"
	end

	def take_off(plane)
		"#{plane} has taken off and left the airport"
	end

	private
	attr_reader :weather, :planes

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

end