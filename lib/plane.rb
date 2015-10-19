require_relative 'weather'

class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def fly
    @flying = true
  end
end
