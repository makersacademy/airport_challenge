require_relative 'airport'
class Plane

  attr_reader :flying
  # used to confirm that plane has taken off or landed
  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def taken_off
    @flying = true
  end

end
