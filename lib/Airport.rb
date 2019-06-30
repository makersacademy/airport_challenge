require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    generate_weather
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Weather is stormy - Cannot land plane" if @weather == 'stormy'
    fail "Airport full" if planes.length >= @capacity
    fail "Plane not flying" unless plane.flying? 

    plane.flying = false if plane.flying?
    @planes << plane
  end

  def plane_take_off(plane)
    fail "Weather is stormy - cannot take off" if @weather == "stormy"
    fail "Plane already flying" if plane.flying?

    @planes.delete(plane)
  end
end
