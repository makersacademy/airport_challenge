class Airport
DEFAULT_CAPACITY = 50

  attr_accessor :capacity
  attr_reader :weather

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = [:sunny,:sunny,:sunny,:stormy].sample
  end

  def land_plane plane
    fail 'Airport is full' if @planes.count >= capacity
    fail 'stormy weather cannot land' if weather == :stormy
    plane.land
    @planes << plane
  end

  def take_off_plane plane
    fail 'No planes available' if @planes.empty?
    fail 'stormy weather cannot take off' if weather == :stormy
    plane.take_off
    @planes.delete plane
  end
end
