require_relative './airport'

class Plane
  attr_accessor :flying

  def initialize
    @flying = true
  end

  def land
    # raise "Plane has already landed" if flying == false
    # "Plane landed"
    @flying = false
  end

  def take_off
  end

end
