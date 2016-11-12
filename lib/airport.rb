require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :landing_bay, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landing_bay = []
    @capacity = capacity
  end

  def store_plane(plane)
    if @landing_bay.length == @capacity
      return "Too full to land"
    else
      @landing_bay << plane
    end
  end

  def force_plane_to_take_off(plane)

    if Weather.new.right_now == "Sunny"
        puts "The plane has taken off\n"
        plane.switch_flying
        return @landing_bay.delete(plane)

    else
       "puts can't take off right now due to stormy weather"
    end
  end






end
