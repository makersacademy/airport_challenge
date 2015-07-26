require_relative 'plane'

class Airport

  attr_accessor :planes, :capacity
  #@@planes = Array.new

  def initialize capacity=5
    @planes = Array.[](Plane.new true)
    @capacity = capacity
  end

  def take_off_order
    @planes.last.take_off
  end

  def landing_order plane
    full? ? fail("Airport is full") : @planes << plane
  end

  def receive plane
    if planes.include?(plane) != true
      fail "Plane not instructed to land"
    else
      @planes.last.landed = true
    end
  end

  def release
    @planes.pop
  end

  def full?
    planes.length >= capacity
  end


end
