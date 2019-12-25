require_relative 'Plane'

class Airport
  # attr_accessor :planes #is this writable? needed?
  attr_reader :weather, :planes

  def initialize(weather = Weather.new) #capacity
    @planes = []
    @weather = weather
  end

  DEFAULT_CAPACITY = 20

  def check_to_land
    raise "Weather is stormy, cannot land" if weather.stormy? #refactor. thoughts?
    land(Plane.new)
  end

  def check_to_take_off
    raise "Plane not functioning" if !plane.working?
    raise "Weather is stormy, cannot take off" if weather.stormy?
    take_off
  end

  def land(plane) #not using check_to_land function - how do they interact?
    raise "Airport full" if @planes.length >= DEFAULT_CAPACITY  #not SRP - create separate function
    raise "Not a plane" unless plane.is_a? Plane
    @planes << plane
    "Plane has landed" #:successful
  end

  def take_off #not using check_to_take_off function
    @planes.pop
    "Plane has left the airport"
  end

end
