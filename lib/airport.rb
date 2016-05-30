require_relative 'plane'
class Airport


  attr_reader :stormy , :plane , :capacity


  DEFAULT_CAPACITY = 1

  def initialize capacity = DEFAULT_CAPACITY
    rand(2) == 1 ? @stormy = true : @stormy = false
    @planes = []
    @capacity = capacity
  end

  def land plane
    fail 'The plane is on the ground Fool!' if plane.landed
    fail 'Sorry, the airport is full.' if self.full
    fail 'Sorry bad weather, find another airport' if self.stormy
    plane.landed = true
    @planes << plane
    self
  end

  def take_off plane
    fail 'The plane is in the air Fool!' unless plane.landed
    fail 'Sorry bad weather, wait a moment' if self.stormy
    plane.landed = false
    @planes.pop
    self
  end

  def full
    @planes.count >= DEFAULT_CAPACITY
  end

private


end