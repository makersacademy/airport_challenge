require 'weather'

class Airport
  attr_accessor :capacity
  attr_reader :hangar
  include Weather

  def initialize
    @capacity = 30
    @hangar = []
    # @weather = stormy?
  end

  def land(plane)
    raise "Unable to land plane: max capacity has been reached." if @hangar.length >= @capacity
    raise "Unable to land plane: weather is stormy." if stormy?
    @hangar << plane
  end

  def take_off(plane)
    raise "Unable to take-off: weather is stormy." if stormy?
    @hangar.delete_if{|plane_in_hangar| plane_in_hangar == plane}
    plane
  end

end