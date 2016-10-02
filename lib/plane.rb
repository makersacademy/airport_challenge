require_relative 'airport'
require_relative 'weather'

class Plane
  attr_accessor :landed
  alias_method :landed?, :landed

  def initialize
    @landed = false
  end

  def land airport
    fail "This is niner-niner-three - airport is full - we can't land!" if airport.full
    fail "MAYDAY! this is niner-niner-three - we can't land in this storm!" if airport.stormy
    fail "Sir, we're already here!" if landed
    @landed = true
    airport.planes << self
  end

  def take_off airport
    fail "Sir, are you crazy? We're already airborne!" if not landed
    fail "Sir, are you crazy? This plane isn't at that airport!" unless airport.planes.include?(self)
    fail "This is niner-niner-three - we can't take off in this storm!" if airport.stormy
    @landed = false
    airport.planes.delete(self)
  end


end
