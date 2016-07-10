require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  attr_accessor :weather_status
  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def request_landing(plane)
    raise "Airport is full, unable to land" if full?
    bad_weather_check
    plane.land
    dock_plane(plane)
  end

  def request_take_off(plane)
    bad_weather_check
    plane.take_off
  end

  private

  def full?
    @hanger.count >= DEFAULT_CAPACITY
  end

  def raise_bad_weather
    raise "bad weather alert" if bad_weather?
  end

  def bad_weather_check
    weather_status == "Stormy" ? raise_bad_weather : nil
  end

  def dock_plane(plane)
    @hanger << plane
  end

end
