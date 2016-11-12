require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_accessor :plane
  attr_accessor :planes
  attr_accessor :weather

  def initialize(weather: Weather.new)
  @planes = Array.new
  @weather = weather
  end

  def release_plane
    plane = Plane.new
  end

  def land(plane)
    @plane = plane
    fail 'plane cannot land in stormy weather' if @weather.stormy?
    fail 'plane has already landed' if @planes.include? @plane
    @planes << @plane
    @planes
  end


  def take_off(plane)
    fail 'no planes to take off' unless @planes.include? @plane
    @planes.pop
  end

  def planecount
    @planes.length
  end


end
