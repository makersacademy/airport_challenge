require_relative 'planes'
require_relative 'weather'

class Airport
  PLANES_CAPACITY = 30

  attr_reader :planes_garage
  attr_reader :capacity

  def initialize(
    initial_planes = nil,
    capacity = PLANES_CAPACITY,
    weather = Weather.new
  )
    @planes_garage = []
    @capacity = capacity
    @weather = weather
    if initial_planes.nil?
      capacity.times { @planes_garage << Plane.new }
    else
      initial_planes.times { @planes_garage << Plane.new }
    end
  end

  def take_off_plane
    raise 'No planes available for take-off!' if empty?
    raise 'Unable to take_off due to stormy weather!' if @weather.stormy?
    plane = @planes_garage.pop
    plane.mark_as_flying
    return plane
  end

  def land_plane(plane)
    raise 'Landing is not possible!' if full? || !plane.flying?
    raise 'Unable to land due to stormy weather!' if @weather.stormy?
    plane.mark_as_landed
    @planes_garage << plane
  end

  private

  def full?
    @planes_garage.count >= @capacity
  end

  def empty?
    @planes_garage.empty?
  end

end
