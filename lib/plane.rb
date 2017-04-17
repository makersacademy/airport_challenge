class Plane
  attr_reader :flying

  def initialize
    @flying = nil
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end

  def landed?
    !@flying
  end

  def taken_off?
    @flying
  end    

end
