require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :hanger

  def initialize(capacity = 10)
    @capacity = capacity
    @hanger = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Airport full" if hanger_full

    raise "This plane is not in the air" if status(plane)

    raise "You must wait due to a storm" if !weather_check

    plane.grounded
    @hanger << plane

  end

  def take_off(plane)
    raise "You must wait due to a storm" if !weather_check

    raise "this plane is not in the hanger" if hanger_check(plane)

    @hanger.delete(plane)
    "Plane has taken off"
  end

  def weather_check
    @weather.check
  end

  private

  def hanger_full
    @hanger.count >= @capacity
  end

  def hanger_check(plane)
    !@hanger.include?(plane)
  end

  def status(plane)
    plane.in_air == false
  end
end
