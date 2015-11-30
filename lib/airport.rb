require_relative '../lib/plane.rb'

class Airport

  attr_reader :plane, :status, :weather, :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather)
    @weather = weather
    fail 'cannot land, too stormy' if stormy?
    fail 'cannot land plane, airport full' if full?
    plane.status('landed')
    hanger
  end

  def take_off(plane, weather)
    @weather = weather
    fail 'cannot take off, too stormy' if stormy?
    plane.status('flying')
    remove_plane
  end

  private

    def full?
      planes.length >= capacity
    end

    def stormy?
      @weather.condition == true
    end

    def hanger
      planes << plane
    end

    def remove_plane
      planes.delete(plane)
    end
end
