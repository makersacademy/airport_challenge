require_relative 'plane.rb'
require_relative 'weather_module'
require_relative 'full_empty_module'

class Airport
  include Full_Or_Empty
  include Weather

  DEFAULT_CAPACITY = 20

  attr_accessor :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Cannot land, airport full' if full?(hangar)
    raise 'Plane already landed' if in_hangar?(plane)
    raise 'Stormy, cannot land!' if stormy?
    hangar << plane
  end

  def take_off(plane)
    raise 'That plane is not in the hangar' if in_hangar?(plane) == false
    raise 'Stormy, cannot take off!' if stormy?
    hangar.delete(plane)
    puts "Plane #{plane} has left the hangar"
  end

  private

  def in_hangar?(plane)
    hangar.include?(plane)
  end
end
