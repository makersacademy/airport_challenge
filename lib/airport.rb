require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 20
  ERROR_FULL = "Airport is full. Please circle the airport awkwardly.".freeze
  ERROR_NO_PLANE = "That plane doesn't exist!".freeze
  ERROR_STORMY = "No can do. It's too stormy, cap'n!".freeze

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land_plane(plane)
    fail ERROR_STORMY if @weather.stormy?
    fail ERROR_FULL if full?
    @planes << plane
  end

  def take_off(plane)
    fail ERROR_STORMY if @weather.stormy?
    fail ERROR_NO_PLANE unless docked?(plane)
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
