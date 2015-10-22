require_relative "airport"

class Plane

  def initialize
    @flying = true
  end

  def land
    raise "Not flying" unless @flying
    @flying = false
  end

  def take_off
    raise "Already flying" if @flying
    @flying = true
  end

end