require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :plane

  def lands_plane(plane, weather)
      raise "Cannot land at airport due to adverse weather conditions" if weather == :stormy
      plane.land
    end

  def take_off(plane)
    plane.flying

  end

end
