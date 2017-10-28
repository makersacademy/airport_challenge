require_relative 'weather'

class Airport

  attr_reader :capacity, :terminal

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @terminal = []
  end

  def land(plane, weather)
    raise "Airport is full" if full?
    weather == true ? "Got a storm front coming, cannot land here" : @terminal << plane
  end

  def take_off(plane, weather)
    weather ? "The skies are dark, best to stay on the ground" : @terminal.delete(plane)
  end

  private

  def full?
    @capacity.nil? ? @terminal.length >= DEFAULT_CAPACITY : @terminal.length >= @capacity
  end

  # def weather
  #   (1..10).sample > 5 ? @stormy = true : @stormy = false
  # end

end
