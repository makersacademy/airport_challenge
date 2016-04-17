require_relative 'airport.rb'

class Plane
attr_accessor :landed
attr_accessor :stormy

DEFAULT_LANDED = true
DEFAULT_STORMY = false

def initialize(landed = DEFAULT_LANDED, stormy = DEFAULT_STORMY)
  @landed = landed
  @stormy = stormy
end

def land(airport)
  if @stormy
    raise "It is too stormy to land"
  else
    @landed = true
  end
end

def landed?
  @landed
end

def take_off
  if @stormy
    raise "It is too stormy to take off"
  else
    @landed = false
  end
end

def stormy?
  @stormy
end

end
