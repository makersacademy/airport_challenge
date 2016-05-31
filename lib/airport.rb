require_relative 'plane'
class Airport


  attr_reader :stormy , :plane , :capacity


  DEFAULT_CAPACITY = 2

  def initialize capacity = DEFAULT_CAPACITY
    rand(2) == 1 ? @stormy = true : @stormy = false
    @planes = []
    @capacity = capacity
  end

  def land plane
    fail 'The plane is on the ground Fool!' if plane.landed
    fail 'Sorry, the airport is full.' if full?
    fail 'The weather is not adequate' if self.stormy
    plane.is_landed
    @planes << plane
    self
  end

  def take_off plane
    fail 'The plane is in the air Fool!' unless plane.landed
    fail 'The weather is not adequate'if self.stormy
    !plane.is_landed
    @planes.pop
    self
  end

  def change_capacity new_capacity
    fail 'the airport capacity cannot be lower than the number of planes' if new_capacity < planes
    @capacity = new_capacity
  end


private


  attr_reader :planes

  def full?
    planes.count >= capacity
  end


end