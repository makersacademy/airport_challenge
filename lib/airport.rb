require_relative 'plane'

class Airport
  attr_accessor :hangar
  def initialize
    @hangar = []
    @weather = 'sunny'
  end

  def takeoff plane
    # fail 'Cannot takeoff if stormy' if weather == 'stormy'
    @hangar.delete(plane)
    plane.takeoff
  end

  def land plane
    @weather = weather
    if @weather == 'stormy'
      fail 'Cannot land in a storm'
    elsif @hangar.count >= 6
      fail 'Airport full'
    else
    @hangar << plane
    plane.land
    end
  end

  def weather
    if rand(2)==1
      'stormy'
    else 'sunny'
    end
  end

end