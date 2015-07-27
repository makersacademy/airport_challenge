require_relative 'plane'

class Airport

  attr_accessor :capacity

  def initialize
    @capacity = 20
    @planes = []

  end

  def receive_plane plane
    fail 'Airport is full' if full?
    fail 'Cannot land due to weather' if weather? == "stormy"

    #plane.land_authorised
    plane.land
    @planes << plane
   
  end

  def release_plane(plane)
    plane.takeoff
    @planes.delete(plane)
  end


  def full?
    @planes.count >= capacity
  end

  def weather?
    x = rand(6)
    return "stormy" if x  <=1
    return "sunny" if x > 1

  end





end
