require_relative 'plane'
class Airport

  attr_reader :stormy
  attr_reader :plane

  DEFAULT_CAPACITY = 1

  def initialize
    rand(2) == 1 ? @stormy = true : @stormy = false
    @planes = Array.new
  end

  def land plane
    raise 'The plane is on the ground Fool!' if plane.landed
    raise 'Sorry, the airport is full. Good luck finding another airport' if self.full
    raise 'Sorry bad weather, find another airport' if self.stormy
    plane.landed = true
    @planes << plane
    return self
  end

  def take_off plane
    raise 'The plane is in the air Fool!' unless plane.landed
    raise 'Sorry bad weather, wait a moment' if self.stormy
    plane.landed = false
    @planes.pop
    return self
  end

  def full
    @planes.count >= DEFAULT_CAPACITY
  end




end