require_relative 'plane'

class Airport
  attr_reader :plane
  CAPACITY = 20

  def initialize(number_of_planes = CAPACITY)
    @number_of_planes = number_of_planes
  end

  def land_plane
    fail "No airports available!" unless @plane
  end

  def takeoff_plane
    fail "No planes available!" unless @plane
  end

  def full?
    @plane.length >= @number_of_planes
  end

  def weather
    ["clear","thunder","raining","snow"].sample
  end
  
end
