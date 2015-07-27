require_relative 'plane'

class Airport

CAPACITY = 100
attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = CAPACITY
  end


  def land plane
    fail 'Airport is full' if full?
    fail 'Too stormy to land' if stormy? 
    plane.landing
    planes << plane
  end

  def release_plane plane
    fail 'Too stormy to take off' if stormy?
    fail 'No planes currently in Airport' if empty?
    plane.take_off
    planes.pop
  end

  def empty?
    planes.empty?
  end

  def stormy?
    weather == "stormy"
  end




  private

  attr_reader :planes

  def weather
    rand(101) > 20 ? "sunny" : "stormy"
  end


  def full?
    planes.count >= capacity
  end
end
