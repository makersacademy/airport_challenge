require_relative 'weather'

class Airport

  attr_reader :capacity, :terminal

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise "Airport is full" if full?
    weather == true ? "Got a storm front coming, cannot land here" : @terminal << plane
  end

  def take_off(plane)
    weather ? "The skies are dark, best to stay on the ground" : @terminal.delete(plane)
  end

  private

  def full?
    @capacity.nil? ? @terminal.length >= DEFAULT_CAPACITY : @terminal.length >= @capacity
  end

  def weather
    (rand(1..10) > 5) ? true : false
  end

end
