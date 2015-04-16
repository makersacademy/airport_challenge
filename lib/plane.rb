class Plane
  attr_accessor :flying
  def initialize
    @flying = true
  end

  def take_off
    fail 'cannot take off' if @flying
    @flying = true
  end

  def land
    fail 'cannot land' unless @flying
    @flying = false
  end
end
