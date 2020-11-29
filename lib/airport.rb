require 'weather'

class Airport
  attr_reader :hanger, :capacity, :weather
  attr_writer :weather
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    @hanger.push(plane) unless full?
  end

  def take_off(plane)
    @hanger.delete(plane)
  end

  private

  def full?
    raise 'Airport Full!' if @hanger.length >= @capacity
  end

end
