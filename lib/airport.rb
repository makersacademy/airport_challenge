require 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :hanger

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
  end

  def instruct_to_take_off plane
    stormy?
    take_off_checks plane
    plane.take_off
    hanger.delete plane
  end

  def instruct_to_land plane
    stormy?
    landing_checks plane
    hanger << plane
    plane.land
  end

  private

  def landing_checks plane
    fail 'Cannot land in stormy weather' if stormy?
    fail 'Airport is full' if hanger.size == capacity
    fail 'Plane already in hanger' if hanger.include?(plane) == true
  end

  def take_off_checks plane
    fail 'Cannot take off in stormy weather' if stormy?
    fail 'That plane is not in hanger' if hanger.include?(plane) == false
    fail 'That plane is flying already' if plane.status == "flying"
  end
end
