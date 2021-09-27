require "weather"

# TODO: can errors be moved into unique classes?
class Airport
  attr_reader :capacity
  attr_reader :landed_planes
  # change this to a proper stub!
  attr_accessor :weather

  def initialize(capacity = 10)
    @landed_planes = []
    @capacity = capacity
    @weather = Weather.new() 
  end

  def attempt_landing(plane)
    raise "Too stormy to land" if stormy?
    raise "Airport full!" if airport_full?
    plane.flying ? land(plane) : raise("Plane is already landed")
  end

  def attempt_takeoff(plane)
    raise "Too stormy to takeoff" if stormy?
    raise "Airport empty!" if airport_empty?
    is_landed?(plane) ? takeoff(plane) : raise("Your plane isn't in the airport!")
  end

  private

  def airport_full?
    @landed_planes.length == @capacity
  end

  def airport_empty?
    @landed_planes.length == 0
  end

  def is_landed?(plane)
    if @landed_planes.include?(plane) || !plane.flying
      true
    else
      false
    end
  end

  def land(plane)
    @landed_planes << plane 
    plane.flying = false
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    plane.flying = true
  end

  def stormy?
    @weather.stormy
  end
end
