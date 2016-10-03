class Plane
  attr_reader :flying

  def initialize
    #@flying = true
  end

  def take_off
    raise "Plane can't take off, it is already flying!"
  end

  def land
    raise "Plane can't land, it isn't flying!" #unless #@flying
    #@flying = false
  end

  def at_airport
    raise "Plane can't be at the aiport, it is already flying!"
  end
end
