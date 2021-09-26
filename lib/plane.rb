require_relative 'airport'

class Plane

  def initialize
  end

  def land(airport)
    fail "The weather is bad! You can't land!" if stormy
    fail "You can't land here. The airport is full!" if airport.full
    airport.hangar << self
  end

  def take_off(airport)
    fail "The weather is bad! Stay on the ground!" if stormy
    airport.hangar.delete(self)
  end

  def left?(airport)
    !airport.hangar.include?(self)
  end

  private

  def stormy
    rand(0..5) == 5 #stormy when 5
  end
end