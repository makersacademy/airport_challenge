require_relative 'airport.rb'

class Plane
attr_accessor :landed
attr_accessor :stormy

DEFAULT_LANDED = false
DEFAULT_STORMY = false

def initialize(landed = DEFAULT_LANDED, stormy = DEFAULT_STORMY)
  @landed = landed
  @stormy = stormy
end

def land(airport)
  if self.landed? == true
    raise "But...we *are* landed!"
  end
  if @stormy
    raise "It is too stormy to land"
  end
    @landed = true
    airport.park(self)
end

def landed?
  @landed
end

def take_off
  if @landed == false
    raise "Can't take off - plane is already airborne!"
  end
  if @stormy
    raise "It is too stormy to take off"
  end
  @landed = false

end

def stormy?
  @stormy
end


end
