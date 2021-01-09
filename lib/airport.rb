require './lib/plane'

class Airport

  attr_reader :runway
  attr_reader :capacity

  def initialize(capacity = 20)
    @runway = Array.new
    @capacity = capacity
  end

  def land_plane(plane)
    return unless plane.landing_permission == true

    full?
    puts "landing plane"
    @runway << plane
  end

  def full?
    raise StandardError.new "Runway full: maintain holding pattern" unless @runway.length < @capacity
  end

  def take_off(plane)
    return if plane.flying? #  && hanger.empty?

    puts "Ready for take off"
    return true
    #  @hangar.pop
  end
end
