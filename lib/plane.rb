
class Plane
  def status_of_plane
     @plane_status
   end

  def land
    @plane_status = "in airport"
  end

  def take_off
    @plane_status = "not in airport"
  end
end
