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
    if hanger_full
      raise "Airport full"
    elsif status(plane)
      raise "This plane is not in the air"
    elsif !weather_check
      "You must wait due to a storm"
    else
      plane.grounded
      @hanger << plane
    end
  end

  def take_off(plane)
    if !weather_check
      "You must wait due to a storm"
    elsif !hanger_check(plane)
      raise "this plane is not in the hanger"
    else
      @hanger.delete(plane)
      "Plane has taken off"
    end
  end

  def weather_check
    @weather.check
  end

  private

  def hanger_full
    @hanger.count >= @capacity
  end

  def hanger_check(plane)
    @hanger.include?(plane)
  end

  def status(plane)
    plane.in_air == false
  end
end
