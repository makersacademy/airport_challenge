require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :plane

  def lands_plane(plane, weather)
      raise "Cannot land at airport due to adverse weather conditions" if weather == :stormy
      plane.land
    end

  def take_off(plane, weather)
      raise "Cannot take off from airport due to adverse weather conditions" if weather == :stormy
      plane.flying
    end

end
