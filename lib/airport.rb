require './lib/plane.rb'

class Airport

attr_reader :airport, :plane

  def airport?
   true
  end

  def plane
    @plane
  end

  # def runway(land_plane, take_off)
  #   if '#{land_plane}' == "runway_free"
  #   elsif '#{take_off}' == "plane in taxi"
  #   end
  # end

  def land_plane(plane)
    if @plane == "runway_free"
    end
  end

  def take_off_plane(plane)
    @plane = false
  end

end
