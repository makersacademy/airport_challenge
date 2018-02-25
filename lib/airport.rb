
require_relative 'plane'
class Airport

  CAPACITY = 5
  attr_reader :capacity
  attr_reader :hangar

  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def landing(plane)
    @hangar << plane
  end

  def take_off(plane)
     plane = @hangar.delete_at(-1)
     plane
    # puts " A plane left the Hangar!"
  end

  def full?
    # @hangar.count >= @capacity
  end


end
