require_relative 'plane'

class Airport

  attr_accessor :planes, :capacity, :weather
  #@@planes = Array.new

  def initialize capacity=5
    @capacity = capacity
    @weather = self.weather
    @planes = Array.[](Plane.new true)
  end

  def take_off_order
    fail "Bad Weather - cannot take off for now" if @weather == 'stormy'
    @planes.last.take_off
  end

  def landing_order plane
    if full?
      fail "Airport is full"
    elsif @weather == 'stormy'
      fail 'Bad Weather - cannot land for now'
    else
        @planes << plane
    end
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

  def weather
    @weather = ['stormy', 'sunny'].sample
  end
end
