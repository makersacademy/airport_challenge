
require_relative 'plane'
require_relative 'weather'
class Airport

  CAPACITY = 10
  attr_reader :capacity
  attr_reader :hangar

  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def landing(plane, storm)
    fail "--BAD WEATHER CONDITION-- landing not possible" if storm
    fail "landing denied, hangar is full!" if full?
    @hangar << plane
  end

  # def take_off(plane)
  #    plane = @hangar.delete_at(-1)
  #    "#{plane}" + 'A plane left the hangar!'
  # end

  def full?
    @hangar.length > @capacity
  end


end
