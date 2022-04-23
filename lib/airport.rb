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

    if random_weather <= 3
      fail "It's blowin' a gale out there, hold your horses"
    end

  end

  def take_off(plane)

    if @hanger.include?(plane)
      @hanger.delete(plane)
    else
      fail "That plane is not available for take off"
    end

  end

  def can_land?

    if random_weather <= 3
      fail "It's blowin' a gale out there, hold your horses"
    end

  end

  def land(plane)

    if full?
      fail "The airport is full, please wait"
    elsif @hanger.include?(plane)
      fail "That plane has already landed"
    else
      @hanger << plane
    end

  end

  def full?

    @hanger.count >= @capacity

  end

end
