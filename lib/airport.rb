require 'airport'
require 'plane'

class Airport

  attr_accessor :hanger

  def initialize(capacity = 5)

    @capacity = capacity
    @hanger = []

  end

  def random_weather

    rand(10)

  end

  def can_take_off?

    return unless random_weather <= 3 
    fail "It's blowin' a gale out there, hold your horses"

  end

  def take_off(plane)

    fail "That plane is not available for take off" unless @hanger.include?(plane)
    @hanger.delete(plane)

  end

  def can_land?

    return unless random_weather <= 3
    fail "It's blowin' a gale out there, hold your horses"

  end

  def land(plane)

    fail "The airport is full, please wait" if full?
    fail "That plane has already landed" if @hanger.include?(plane)
    @hanger << plane

  end

  def full?

    @hanger.count >= @capacity

  end

end
