require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10

    def initialize(capacity=DEFAULT_CAPACITY, weather: Weather.new)
      @planes = []
      @capacity = capacity.to_i
      @weather = weather
    end

    def authorise_land(plane)
      fail "Landing denied: Airport full" if full?
      fail "Landing denied: Adverse weather" if stormy?
      land(plane)
    end

    def land(plane)
      plane.landed?
      planes << plane unless planes.include? plane
    end

    def take_off(plane)
      fail "Take-off denied: Adverse weather" if stormy?
      if planes.include? plane
        planes.delete(plane)
      else
        fail "Plane already departed"
      end
      confirm_departed(plane)
    end

    def confirm_departed(plane)
      plane.taken_off?
    end

  private
    attr_reader :weather

    def planes
      @planes
    end

    def full?
      @planes.length >= @capacity
    end

    def stormy?
      weather.stormy
    end

end
