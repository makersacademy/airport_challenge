require_relative 'plane'

class Airport

  attr_accessor :planes
  #@@planes = Array.new

  def initialize
    @planes = Array.[](Plane.new true)
  end

  def take_off_order
    @planes.last.take_off
  end

  def landing_order plane
    @planes << plane
  end

  def receive plane
    if planes.include? plane
      @planes.last.landed = true
    else
      fail "Plane not instructed to land"
    end
  end

  def release
    @planes.pop
  end


end
