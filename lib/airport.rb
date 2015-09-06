require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  include Weather

  DEFAULT_CAPACITY = 5

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_land(plane)
    fail 'Plane has already landed' if @planes.include?(plane)
    fail 'Cannot currently land at airport' if full? || weather ==:stormy
    @planes << plane
    return 'Plane is landed'
  end

  def plane_take_off(plane)
    fail 'Cannot currently take off' if empty? || weather ==:stormy
    @planes.delete(plane)
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
