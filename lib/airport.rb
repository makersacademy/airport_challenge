class Airport
  DEFAULT_CAPACITY = 20
  ERROR_FULL = "Airport is full. Please circle the airport awkwardly.".freeze
  ERROR_NO_PLANE = "That plane doesn't exist!".freeze

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail ERROR_FULL if full?
    @planes << plane
  end

  def take_off(plane)
    fail ERROR_NO_PLANE unless @planes.include?(plane)
    @planes.delete(plane)
  end

  private
    def empty?
      @planes.size == 0
    end

    def full?
      @planes.size >= @capacity
    end
end
