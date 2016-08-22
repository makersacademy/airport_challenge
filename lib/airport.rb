require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    landing_checks(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    take_off_checks(plane)
    plane.taken_off
    @planes.delete(plane)
  end

  private

  attr_reader :planes ,  :weather

    def full?
      planes.count >= @capacity
    end

    def bad_weather?
      @weather.stormy?
    end

    def plane_at_airport(plane)
      @planes.include? plane
    end

    def landing_checks(plane)
      fail "This plane is already at an airport" if plane.grounded == true
      fail "Planes cannot land in stormy weather" if bad_weather?
      fail "Planes cannot land when airport is full" if full?
    end

    def take_off_checks(plane)
      fail "This plane is already flying" if plane.grounded == false
      fail "This plane is not at this airport" unless plane_at_airport(plane)
      fail "Planes cannot take off in stormy weather" if bad_weather?
    end

end
