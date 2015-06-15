require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize (capacity = DEFAULT_CAPACITY)

    @capacity = capacity
    @planes = []

  end

  def take_off plane
    raise 'The plane is not in the airport' unless planes.include?(plane)
    raise 'The weather is too stormy to take-off' if stormy?
    raise 'The airport is empty' if empty?
    plane.take_off
    planes.delete(plane)
  end

  def landing plane
    raise 'The plane is already in the airport' if planes.include?(plane)
    raise 'The weather is too stormy to land' if stormy?
    raise 'The airport is currently full' if full?
    planes << plane
    plane.landing
  end

   def empty?

    planes.count == 0

  end

  private

  attr_reader :planes

  def full?

    planes.count >= capacity

  end

  def weather
    rand(10) > 8 ? 'stormy' : 'sunny'

  end

  def stormy?
    weather == 'stormy'
  end

end













