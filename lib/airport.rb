require_relative 'plane'
require_relative 'weather'
require_relative 'sky'

class Airport

  attr_reader :planes, :capacity, :sky

  def initialize(capacity = 10)
    @sky = Sky.new
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather = Weather.new)
    in_sky?(plane)
    airport_full?
    check_weather(weather)
    @planes << plane
    @sky.flying_planes.delete_at(@sky.flying_planes.index(plane))
    self
  end

  def take_off_plane(plane, weather = Weather.new)
    check_weather(weather)
    @planes.delete(plane)
    self
  end

  def in_sky?(plane)
    fail "this plane isn't available to land" unless @sky.flying_planes.include?(plane)
  end

  def airport_full?
    fail "can't land as airport is full" if @planes.length == @capacity
  end

  def check_weather(weather)
    fail "can't do that due to storms" if weather.condition == "stormy"
  end

end
