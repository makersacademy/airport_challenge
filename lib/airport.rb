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
    fail 'Airport is full' if full?
    fail 'stormy weather cannot land' if stormy?
    plane.land
    @planes << plane
  end

  def take_off_plane plane
    fail 'No planes available' if empty?
    fail 'stormy weather cannot take off' if stormy?
    plane.take_off
    @planes.delete plane
  end


  private

  def stormy?
    weather == :stormy
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

end
