require_relative 'Plane'
require_relative 'Weather'

class Airport

  DEFAULT_CAPACITY = 50
  attr_reader :planes
  attr_accessor :capacity, :weather


  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "This airport is full" if full?
    raise "This plane cannot land until the weather clears up" if stormy?
    expect_plane(plane)
    plane.land(self)
    @expected_plane = nil
    @planes << plane
  end

  def takeoff(plane)
    raise "That plane is not at this airport" unless @planes.include?(plane)
    raise "This plane cannot take off until the weather clears up" if stormy?
    send_to_runway(plane)
    plane.takeoff
    @on_runway = nil
    @planes.delete(plane)
  end

  def send_to_runway(plane)
    @on_runway = plane
  end

  def expect_plane(plane)
    @expected_plane = plane
  end

  def plane_expected?(plane)
    plane == @expected_plane
  end

  def on_runway?(plane)
    plane == @on_runway
  end

private

  def stormy?
    @weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end


end
