class Plane
  attr_accessor :flying
  def initialize
    @flying = true
  end

  def take_off
    fail 'cannot take off' if @flying
    @flying = true
  end
end
