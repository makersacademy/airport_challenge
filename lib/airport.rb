require_relative 'plane'

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize capacity = DEFAULT_CAPACITY
    @landed_planes = []
    @capacity = capacity
  end

  def let_take_off plane
    fail 'Stormy weather!' if stormy?
    plane.take_off
    @landed_planes.delete plane
  end

  def let_land plane
    fail 'Stormy weather!' if stormy?
    traffic_control
    plane.land
    @landed_planes << plane
    plane
  end

  def traffic_control
    fail 'Airport is full!' if full?
  end

  def weather_control
    ['stormy', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny'].sample
  end

  def stormy?
    weather_control == 'stormy' ? true : false
  end

  def full?
    @landed_planes.count >= @capacity
  end

end

