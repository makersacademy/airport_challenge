require 'plane_file'

class Airport

  def initialize
    @planes = Array.new
  end

  def land(plane_name)
    @planes << plane_name
    #plane_name.proceed_to_land
  end

  def which_planes
    @planes
  end

  def landed?(plane_name)
    @planes.include?(plane_name)
  end
end
