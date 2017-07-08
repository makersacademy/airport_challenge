require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :capacity


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    puts "capacity = #{capacity}"
  end

  def landing_clear?
    raise 'Negative. Cancel landing because of the weather.' if stormy?
    raise 'Negative. Airport is full.' if full?
    true
  end

  def takeoff_clear?
    raise 'Negative. Cancel take-off because of the weather.' if stormy?
    true
  end

  def plane_arrived(plane)
    @planes << plane
  end

  def plane_left(plane)
    @planes.delete plane
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
