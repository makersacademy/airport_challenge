class Airport
  def initialize
    @plane = 0
  end
  def land(plane)
    @plane += 1
  end
  def take_off(plane)
    @plane -=1
  end

private
  def full?
    if @plane == 20
      return true
    end
      return false
  end
  def empty?
    if @plane == 0
      return true
    end
    return false
  end
end

class Plane
  def initialize
  end
end
