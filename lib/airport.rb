require_relative '../lib/plane.rb'

class Airport

  attr_reader :plane, :status, :weather, :planes, :capacity

  CAPACITY = 20

  def initialize
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather)
    @weather = weather
    fail 'cannot land, too stormy' if @weather.condition == true
    fail 'cannot land plane, airport full' if full?
    @plane = plane
    @plane.status('landed')
    @planes << plane
  end

  def take_off(plane, weather)
    @weather = weather
    fail 'cannot take off, too stormy' if @weather.condition == true
    @plane = plane
    @plane.status('on air')
  end

  private

    def full?
      planes.length >= CAPACITY
    end
end
