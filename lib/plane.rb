require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def land
   @flying = false
  end

  def taken_off
    @flying = true
  end

end
