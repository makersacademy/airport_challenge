require './lib/plane'

class Airport

  attr_reader :runway

  def initialize
    @runway = Array.new
  end

  def land_plane(plane)
    return unless plane.landing_permission == true

    puts "landing plane"
    @runway << plane
  end

  def take_off(plane)
    return if plane.flying? # && hanger.empty?

    puts "Ready for take off"
    return true
    #  @hangar.pop
  end
end
