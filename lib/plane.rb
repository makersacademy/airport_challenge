require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def landing
    @flying = false
  end


end
