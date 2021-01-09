require './lib/plane'

class Airport

  attr_reader :runway

  def initialize
    @runway = Array.new
    @capacity = 20
  end

  def land_plane(plane)
    return unless plane.landing_permission == true

    full?
    puts "landing plane"
    @runway << plane
    puts @runway.length
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
