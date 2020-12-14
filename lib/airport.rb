
class Airport
  DEFAULT_CAPACITY = 20
  def initialize
      @terminal = []
  end

  def land(plane)
    @terminal  << plane
  end
  
  def take_off(plane)
    plane !~ @terminal
  end

  def full
    plane.replace("BA31")
  end

  def terminal
    @terminal
    plane = "BA30"
  end
end
