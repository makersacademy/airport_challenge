require_relative 'plane'

class Airport
  attr_accessor :hangar
  def initialize
    @hangar = []
  end

  def takeoff plane
    hangar.pop
    plane.takeoff
  end

  def land plane
    fail 'Airport full' if @hangar.count >= 6
    @hangar << plane
    plane.land
  end

  weather [:sunny, :stormy]
  weather_today = weather ([rand(2)])

end