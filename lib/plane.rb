class Plane
  attr_reader :flying
  alias_method :take_off, :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def take_off
    @flying
  end
end

plane = Plane.new
p plane.landed
p plane.flying?
# plane.take_off
# p plane.flying?
p plane
