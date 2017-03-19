require './lib/weather_check.rb'

class Airport
  include Weather
  attr_reader :airplanes, :capacity
  attr_writer :capacity

DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end

  def land(plane)
    raise "There is no available space in this airport." if full?
    raise "Plane can only land when flying." if ready_to_land?(plane)
    raise "Plane cannot land due to stormy weather." if weather?
    plane.landed
    @airplanes << plane
  end

 def takeoff(plane)
   raise "Plane cannot takeoff if not landed in airport." if ready_to_takeoff?(plane) == false
   raise "Plane cannot takeoff due to stormy weather." if weather?
   plane.flying #Not tested
   @airplanes.delete(plane) #Not tested
end

  def landed?(plane)
    true if ready_to_takeoff?(plane)
  end

private

def ready_to_land?(plane)
  true if plane.status == "Landed"
end

def ready_to_takeoff?(plane)
  if @airplanes.include? plane
    true
else
  false
end
end

def full?
true if @airplanes.count >= @capacity
end
end
