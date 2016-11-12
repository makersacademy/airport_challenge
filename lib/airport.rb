require_relative  "plane.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.has_landed = true
    true
  end

  def take_off(plane)
     @planes.select{|element| return plane if plane == element}
  end

end
