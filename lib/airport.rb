require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10

    def initialize(capacity=DEFAULT_CAPACITY)
      @planes = []
      @capacity = DEFAULT_CAPACITY
      @weather = Weather.new
    end

    def confirm_land(plane)
      fail "Landing denied: Airport full" if full?
      fail "Landing denied: Adverse weather" if stormy?
      land(plane)
    end

    def land(plane)
      plane.landed?
      @planes << plane
    end

    def take_off(plane)
      fail "Take-off denied: Adverse weather" if stormy?
      @planes.delete(plane)
      plane.departed?
    end

    # private

    def planes
      @planes
    end

    def full?
      @planes.length >= @capacity
    end

    def stormy?
      @weather.stormy?
    end

end
