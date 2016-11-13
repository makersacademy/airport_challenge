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
    raise("Unable to land because of the stormy weather") if @weather == :Stormy
    check_weather
    store(plane)
    "#{plane} has landed"
  end

  def take_off(plane)
    raise("Plane is still in the air") if plane.landed_status == false
    raise("Unable to take off because of the stormy weather") if @weather == :Stormy
    check_weather
    remove_plane(plane)
  end

  def store(plane)
    plane.landed_status = true
    @planes << plane
  end

  def remove_plane(plane)
    plane.landed_status = false
    @planes.delete(plane)
    "#{plane} has taken off"
  end

  def check_weather
    @weather = Weather.new.todays_weather
  end

end
