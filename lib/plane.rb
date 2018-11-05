require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def flying
    @flying = true
  end

  def landed
    @status = false
  end

end
