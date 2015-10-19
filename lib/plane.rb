class Plane

  attr_reader :landed, :flying

  def initialize
    @flying = true
  end

  def land
    fail 'You are not flying' if @flying == false
    #@landed = true
    @flying = false
  end

  def take_off
    fail 'You are already flying' if @flying
    @flying = true
  end

  def taken_off?
    @flying
  end

end
