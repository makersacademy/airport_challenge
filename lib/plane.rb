class Plane
  attr_accessor :flying
  def initialize(flying=true)
    @flying = flying
  end
  def land
    raise "You can't land a plan that is on the ground" unless @flying
    'landing'
  end
end