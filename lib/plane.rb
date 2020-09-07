require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize(flying=false)
    @flying = flying
  end

  def take_off(origin)
    if @flying
      fail "This plane is in the air"
    else
      @flying = true
    end
  end

  def land(destination)
    if @flying == false || destination.full?
      fail "The plane cannot be landed"
    else
      destination.store_plane(self)
      @flying = false
    end
  end

end