require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  attr_reader :planes

  def initialize
    @planes = []
  end

  def landed_at(plane)
    @planes << plane
  end

  def departed(plane)
    @planes.delete(plane)
  end

  def ready_for_take_off?
    return false if stormy? == true
    true
  end

end
