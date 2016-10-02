require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    check_for_landing(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    check_for_take_off(plane)
    plane.taken_off
    @planes.delete(plane)
  end

    private

    attr_reader :planes , :weather

    def full?
      @planes.count >= @capacity
    end

    def stormy_weather
      @weather.stormy
    end

    def plane_in_airport(plane)
      @planes.include? plane
    end

    def check_for_landing(plane)
      fail 'Grounded planes cannot land' if plane.grounded == true
      fail 'Weather too stormy for landing' if stormy_weather
      fail 'Airport full, plane cannot land' if full?
    end

    def check_for_take_off(plane)
      fail 'Plane out flying' if plane.grounded == false
      fail 'Plane at other airport' unless plane_in_airport(plane)
      fail 'Weather too stormy for take off' if stormy_weather
    end
end
