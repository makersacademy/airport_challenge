require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def land
    raise "Plane landed cannot land" if landed?
    @flying = false
  end

  def take_off
    raise "Plane flying cannot take off" if flying?
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    return true unless @flying
  end
end
