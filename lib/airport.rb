require_relative 'plane'

class Airport

  private

  @weather

  public

  attr_reader :capacity, :planes
  attr_writer :weather

  def initialize
    @weather = rand(1..100)
    @planes = []
    @capacity = 1
  end

  def full?
    true if @planes.count >= @capacity
  end

  def weather
    return @weather <= 90 ? 'sunny' : 'stormy'
  end

  def set_weather=(weather)
    @weather = weather
  end

end
