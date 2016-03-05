require_relative 'airport'

class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end
  
  def flying?
    @flying
  end

  def landed
    @flying = false
  end
end
