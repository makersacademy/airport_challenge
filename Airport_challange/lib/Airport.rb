require_relative "plane.rb"

class Airport

  attr_reader :hanger

  def initiailze

  end
    
  def land_plane(plane)
    @hanger = []
    @hanger << plane
  end

  def controler_confirm
    if !@hanger.include? plane
      "Plane has taken off"
    else
      raise "Plane was not allowed to take off"
    end
  end

end




# class Airport
#   # attr_reader :plane

#   def initiailze(hanger,plane)
#     @hanger = []
#   end

#   def land_plane(plane)
#     @hanger << plane
#   end

#   def take_off(plane)
#     plane
#   end


# end





