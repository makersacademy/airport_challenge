require_relative 'airport'

class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land
    @flying = false
  end

  def landed?
    true
  end



end
