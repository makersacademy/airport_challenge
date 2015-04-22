class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize options = {}
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @weather = %w(sunny sunny sunny sunny stormy).shuffle.pop
  end

  def land plane
    fail 'Sorry, Airport Full' if full?
    fail 'Impossible, Stormy Weather' if stormy_weather?
    planes << plane
  end

  def take_off
    fail 'Airport is Empty' if empty?
    fail 'Impossible, Stormy Weather' if stormy_weather?
    planes.pop
  end

  def plane_count
    planes.length
  end

  private

  attr_accessor :planes
  attr_reader :weather

  def empty?
    planes.empty?
  end

  def full?
    planes.length >= capacity
  end

  def stormy_weather?
    weather == 'stormy'
  end
end
