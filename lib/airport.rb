require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 20
  ERROR = {
    full: "Not enough room. Please circle the airport awkwardly.",
    no_plane: "404 plane not found",
    stormy: "No can do. It's too stormy, cap'n!"
  }.freeze

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land_plane(plane)
    fail ERROR[:stormy] if @weather.stormy?
    fail ERROR[:full] if full?
    @planes << plane
  end

  def take_off(plane)
    fail ERROR[:stormy] if @weather.stormy?
    fail ERROR[:no_plane] unless docked?(plane)
    @planes.delete(plane)
  end

  def docked?(plane)
    @planes.include?(plane)
  end

  private

    attr_reader :planes

    def empty?
      @planes.empty?
    end

    def full?
      @planes.size >= @capacity
    end
end
