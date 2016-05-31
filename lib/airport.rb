require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 20
  ERROR = {
    stormy: "No can do. It's too stormy, cap'n!",
    full: "Not enough room. Please circle the airport awkwardly.",
    plane_missing: "404 plane not found.",
    plane_docked: "The plane has already landed!"
  }.freeze

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land_plane(plane)
    landing_checks(plane)
    plane.flight_end
    planes << plane
  end

  def take_off(plane)
    take_off_checks(plane)
    plane.flight_start
    planes.delete(plane)
  end

  private

  attr_accessor :capacity, :planes

  def docked?(plane)
    planes.include?(plane)
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.size >= capacity
  end

  def landing_checks(plane)
    fail ERROR[:stormy] if @weather.stormy?
    fail ERROR[:full] if full?
    fail ERROR[:plane_docked] if docked?(plane)
  end

  def take_off_checks(plane)
    fail ERROR[:stormy] if @weather.stormy?
    fail ERROR[:plane_missing] unless docked?(plane)
  end
end
