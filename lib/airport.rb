require_relative './plane'
require_relative './Weather'
class Airport
  include Weather
  def land_plane plane
    if Weather.stormy
      'weather conditions prvent landing'
    else
      plane
    end
  end
  def depart_plane plane
    if Weather.stormy
      'weather conditions prvent take-off'
    else
      plane
    end
  end

end
