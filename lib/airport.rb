require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize
    @planes = []
    @weather_conditions= ['Stormy', 'Sunny']
  end

  def land plane
    fail 'Airport is Full' if full?
    fail 'Storm\'s a Brewin' if weather == 'Stormy' && plane.landed ==  false
    plane.has_landed
    @planes << plane
  end

  def take_off plane
    fail 'Storm\'s a Brewin' if weather == 'Stormy'
    plane.taken_off
    @planes.delete(plane)
  end

  def plane_check
    @planes
  end

  def weather
    @weather_conditions.sample
  end

  private

  def plane_count
    @planes.length
  end

  def full?
    plane_count >= DEFAULT_CAPACITY
  end
end
