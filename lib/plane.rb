class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def lands
    @flying = false
  end

  def takes_off
     @flying = true
  end

end
