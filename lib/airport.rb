require 'plane.rb'

class Airport 
  DEFAULT_CAPACITY = 1
  attr_accessor :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = ["sunny", "cloudy", "light rain", "little wind", "stormy"].sample()
  end

  def land(plane)
    if canweland?()
      @hanger << plane
      plane.landed
    else
      fail @errormessage
    end
  end

  def takeoff(plane)
    if stormy?()
      fail "Weather is stormy"
    else
      @hanger.pop
      plane.takingoff
    end
  end

  private

  def full?
    if @hanger.count == @capacity
      true
    else
      false 
    end
  end

  def stormy?
    if @weather == "stormy"
      true
    else
      false
    end
  end

  def canweland?
    if full?() && stormy?()
      @errormessage = "Airport full and weather is stormy"
      false
    elsif full?()
      @errormessage = "The airport is full"
      false
    elsif stormy?()
      @errormessage = "Weather is stormy"
      false
    else
      true
    end
  end
end 