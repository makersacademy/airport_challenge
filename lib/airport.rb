require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 6

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    before_land(plane)

    hangar << plane

    weather.change
  end

  def take_off(plane)
    before_take_off(plane)

    hangar.delete(plane)

    weather.change

    "#{plane} has just taken off"
  end

  private

  def before_land(plane)
    raise "Already in hangar" if plane?(plane)
    raise "Hangar is at its full capacity" if full?
    weather.change & raise("Can't land due to stormy weather") if weather.stormy?
  end

  def before_take_off(plane)
    raise "Plane not in hangar" unless plane?(plane)
    weather.change & raise("Can't take off due to stormy weather") if weather.stormy?
  end

  def plane?(plane)
    hangar.include?(plane)
  end

  def full?
    hangar.count == capacity
  end
end
