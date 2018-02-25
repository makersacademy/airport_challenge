
require_relative 'plane'
require_relative 'weather'
class Airport

  CAPACITY = 5
  attr_reader :capacity
  attr_reader :hangar

  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def landing(plane)
    fail "landing denied, hangar is full!" if full?
    @hangar << plane
  end

  def take_off(plane)
     plane = @hangar.delete_at(-1)
     "#{plane}" + 'A plane left the hangar!'
  end

  def full?
    @hangar.length >= @capacity
  end


end
