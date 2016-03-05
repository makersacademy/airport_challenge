require_relative 'airport'

class Plane

  def initialize
    @flying = false
  end

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def status
    @flying
  end


end
