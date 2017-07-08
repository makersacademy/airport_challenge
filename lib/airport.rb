require_relative 'plane'
# require 'weather'

class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :planes

    def initialize
      @planes = []
      @capacity = DEFAULT_CAPACITY
    end

    def confirm_land(plane)
      fail 'Landing denied: Airport full' if full?
      land(plane)
    end

    def land(plane)
      @planes << plane
    end

    def take_off(plane)
      @planes.delete(plane)
      return @planes
    end

    private

    def full?
      @planes.length >= @capacity
    end

end
