require_relative 'passengers'
require_relative 'planes'
require_relative 'weather'

class Airport
  PLANES_CAPACITY = 30

  attr_reader :planes_garage
  attr_reader :capacity

  def initialize(initial_planes = nil, capacity = PLANES_CAPACITY, weather = Weather.new)
    @planes_garage = []
    @capacity = capacity
    @weather = weather
    if initial_planes.nil?
      capacity.times { @planes_garage << Planes.new }
    else
      initial_planes.times { @planes_garage << Planes.new }
    end
  end

  def take_off_plane
    if empty?
      raise 'No planes available for take-off!'
    elsif @weather.stormy?
      raise 'Unable to take_off due to stormy weather!'
    else
      @planes_garage.pop
    end
  end

  def land_plane(plane)
    if full?
      raise 'Take-off is not possible. Airport is full!'
    elsif @weather.stormy?
      raise 'Unable to land due to stormy weather!'
    else
      @planes_garage << plane
    end
  end

  def on_bording_passangers
  end

  def off_bording_passangers
  end

  private

  def full?
    @planes_garage.count >= @capacity
  end

  def empty?
    @planes_garage.empty?
  end

end
