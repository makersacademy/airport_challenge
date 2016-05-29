require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 10

	def initialize
		@weather = Weather.new
		@capacity = []
	end

	def land(plane)
		raise "Airport is full" if full?
		capacity << plane
		"#{plane} has landed"
	end

	def take_off(plane)
		"#{plane} has taken off and left the airport"
	end

	private
	attr_reader :weather, :capacity

  def full?
    capacity.length >= DEFAULT_CAPACITY
  end

end