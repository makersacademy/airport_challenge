require './lib/weather.rb'
require './lib/plane.rb'

class Airport

attr_accessor :weather, :capacity, :planes

  def initialize(capacity = 1)
    @weather = Weather.new.todays_weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise("Only planes can be landed") if !plane.instance_of? Plane
    raise("Plane has already landed") if plane.landed_status == true
    raise("Airport is full. Plane is unable to land") if @planes.length == @capacity

    if @weather == :Stormy
      "Unable to land plane in stormy weather"
    else
    plane.landed_status = true
    store(plane)
    check_weather
    "#{plane} has landed"
    end

  end

  def has_plane_landed?(plane)
    return "yes" if plane.landed_status == true
    "no" if plane.landed_status == false
  end

  def take_off(plane)
    raise("Plane is still in the air") if plane.landed_status == false

    if @weather == :Stormy
      check_weather
      "Unable to take off because of the stormy weather"
    else
    plane.landed_status = false
    @planes.delete(plane)
    check_weather
    "#{plane} has taken off"
    end
  end

  def store(plane)
    @planes << plane
  end

  def check_weather
    @weather = Weather.new.todays_weather
  end


end
