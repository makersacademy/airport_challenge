class Plane
  def initialize
    @flying = true
  end
  # attr_reader :flying

def flying?
 @flying
end

  def status
     flying? ? :flying : :landed
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end
end
