require 'airport'
class Plane
  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def arrived
    @flying = false
  end

  def departed
    @flying = true
  end

end
