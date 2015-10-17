require_relative 'plane'

class Airport

  private

  @weather

  public

  DEFAULT_CAPACITY = 1

  attr_reader :capacity, :planes, :location
  attr_writer :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather = rand(1..100) 
    @planes = []
    @capacity = capacity
    @location = self.object_id
  end

  def full?
    true if @planes.count >= @capacity
  end

  def weather
    return @weather <= 90 ? 'sunny' : 'stormy'
  end

  def weather=(weather)
    @weather = weather
  end

end
