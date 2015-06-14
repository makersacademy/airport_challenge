require_relative 'plane'
class Airport

  def tell_plane_to_land plane
    plane.change_landing_status
  end

end
