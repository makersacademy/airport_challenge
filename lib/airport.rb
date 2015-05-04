require_relative 'plane'

class Airport
  attr_accessor :hangar
  def initialize
    @hangar = []
  end

  def takeoff plane
    fail 'Cannot takeoff if stormy' if weather == 'stormy'
    @hangar.delete(plane)
    plane.takeoff
  end

  def land plane
    fail 'Airport full' if @hangar.count >= 6
    @hangar << plane
    plane.land
  end

  # def weather
  #   if rand(10)==1
  #     'stormy'
  #   else 'sunny'
  #   end
  # end

end