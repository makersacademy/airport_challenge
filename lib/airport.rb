require_relative "plane"
class Airport
attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def landed?(plane)
    if planes.include? plane; true
    else false
    end
  end

  def take_off(plane)
    planes.pop
  end

  def took_off?(plane)
    if planes.include? plane; false
    else true
    end
  end
end
