require_relative 'airport'

class Plane
  attr_accessor :ground_location

  def initialize(ground_location = nil)
    @ground_location = ground_location
  end

  def land(airport)
    fail "The weather is bad! You can't land!" if stormy
    fail "You can't land here. The airport is full!" if airport.full
    fail "This plane is already on the ground!" if ground_location == :ground
    self.ground_location = :ground
    airport.hangar << self
  end

  def take_off(airport)
    fail "The weather is bad! Stay on the ground!" if stormy
    fail "This plane is not in this airport!" if left?(airport)
    airport.hangar.delete(self)
    self.ground_location = :sky
  end

  def left?(airport)
    !airport.hangar.include?(self)
  end

  private

  def stormy
    rand(0..5) == 5 # stormy when 5
  end
end
