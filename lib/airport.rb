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
    planes << plane
    plane.landing
  end

  def release_plane
    fail 'Too stormy to take off' if stormy?
    fail 'No planes currently in Airport' if empty?
    plane = planes.find{ |plane| plane.landed?}
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
    rand(101) > 15 ? "sunny" : "stormy"
  end


  def full?
    planes.count >= capacity
  end
end
