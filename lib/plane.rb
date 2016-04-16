

class Plane
  attr_reader :location, :flying

  def initialize
    @location = "Airplane factory"
    @flying = false
  end

  def broadcast_location
    location
  end

  def land
    fail "I haven't taken off yet mate" unless flying
    @location = 'airport'
    @flying = false
    nil
  end

  def take_off
    fail "I'm already up here mate" if flying
    @location = 'where eagles soar'
    @flying = true
    nil
  end

end
