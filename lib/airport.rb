require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(*)
    @planes << Plane.new # "#{plane}: Plane has landed"
  end

  def plane_take_off(*)
    @planes.pop
    "plane has taken off"
  end

  def empty?
    raise ArgumentError, "Airport is empty" if @planes == []
    "There are #{@planes.count} plane/planes"
  end

  def take_off(*)
    raise ArgumentError, "Take-off denied due to storm" if rand_weather == 1
    "Sunny weather - take off allowed"
  end

  def rand_weather
    if rand(1..3) == 1; 1
    else
      "Sunny weather - take off allowed"
    end
  end

  def to_land(*)
    raise ArgumentError, "No landing permitted during storm" if rand_weather == 1
    "#{@planes}: Plane has landed"
  end
end
