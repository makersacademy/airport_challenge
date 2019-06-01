require 'planes'

class Airport
  attr_reader :planes

  def land_plane(planes)
    @planes = planes
  end

  def apron(planes)
    @planes = planes
  end
end
