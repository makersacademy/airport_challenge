require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  attr_accessor :weather
    DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes   = []
    @capacity = capacity
    @weather  = 'sunny'
  end

  def land(plane)
    landing_fail_checks(plane)
    plane.land
    @planes << plane
    change_weather
  end

  def take_off(plane)
    take_off_fail_checks(plane)
    plane.take_off
    @planes.delete(plane)
    change_weather
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length <= 0
  end

  def sunny?
    @weather == 'sunny'
  end

  def stormy?
    @weather == 'stormy'
  end

  private
  def take_off_fail_checks(plane)
    fail 'Plane Already Flying' if plane.flying?
    fail 'Plane Not At This Airport' unless @planes.include?(plane)
    if stormy?
      change_weather
      fail 'Unable to Take Off Due to Stormy Weather'
    end
  end

  def landing_fail_checks(plane)
    fail 'Plane Already Grounded' if plane.grounded?
    fail 'Airport Full' if full?
    if stormy?
      change_weather
      fail 'Unable to Land Due to Stormy Weather'
    end
  end

  def change_weather
    chance_of_rain = rand(101)
    @weather = case
    when chance_of_rain <= 80 then 'sunny'
    else
      'stormy'
    end
  end
end
