require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hangar
  attr_accessor :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity  
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

  def hangar_full?
    @hangar.length == capacity
  end

end
