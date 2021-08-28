require 'plane'

class Airport
  LOCAL_WEATHER = ["stormy", "sunny", "drizzle", "light cloud", "clement"]
  CAPACITY = 1

  def initialize
    @landed_planes = []
  end

  def weather?
    LOCAL_WEATHER[rand(5)]
  end

  def land_plane(plane)
    raise "Insufficient capacity" if @landed_planes.length >= CAPACITY

    raise "Stormy weather, impossible to land" if weather? == "stormy"

    @landed_planes.push(plane)
    "Plane has successfully landed"
  end

  def takeoff(plane)
    raise "Stormy weather, impossible to take off" if weather? == "stormy"
    
    @landed_planes.each do |landed|
      if landed == plane
        @landed_planes.delete(plane)
        return "Plane has departed"
      end
    end
    raise "Plane not at airport!"
  end
end
