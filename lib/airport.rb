
require_relative 'plane'
require_relative 'weather'
class Airport

  CAPACITY = 10
  attr_reader :capacity
  attr_reader :hangar

  def initialize(capacity = CAPACITY, station = Weather.new)
    @hangar = []
    @capacity = capacity
    @station = station
  end

  def landing(plane)
    fail "--BAD WEATHER CONDITION-- landing not possible" if @station.storm?
    fail "landing denied, hangar is full!" if full?
    @hangar << plane
  end

  def take_off(plane)
    fail "--BAD WEATHER CONDITION-- take_off is not possible" if @station.storm?
     plane = @hangar.delete_at(-1)
     "#{plane}" + 'A plane left the hangar!'
  end

  def full?
    @hangar.length >= @capacity
  end
end
