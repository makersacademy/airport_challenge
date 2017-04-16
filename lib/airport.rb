require_relative 'plane'
class Airport
  attr_accessor :run_way

  def initialize
    @run_way = []
  end

  def airport_check(plane)
    if plane.in_air == false && @run_way.include?(plane) == false && plane.in_other == false
      plane.in_other = true
      @run_way << plane
    end
    plane
  end

end
