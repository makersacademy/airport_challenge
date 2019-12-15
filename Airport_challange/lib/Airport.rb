require "plane.rb"

class Airport

  attr_reader :hanger

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    # @capcaity = capacity
    @hanger = []
  end

  def land_plane(plane)
    fail "Cannot land, Airport full" if full?
    @hanger << plane
  end

  def take_off(plane)
    @hanger.delete(plane)
  end

  def hanger_check 
    @hanger
  end

  def air_traffic_controller(plane)
    if !@hanger.include? plane
      "The plane has taken off"
    else 
      raise "The Plane is grounded"
    end
  end

  def full?
    @hanger.count >= DEFAULT_CAPACITY
  end

end








# require_relative "plane"

# class Airport

#   attr_reader :hanger

#   def initiailze
#     @hanger = []
#   end

#   def hanger_check
#     @hanger
#   end

#   def land_plane(plane)
#     @hanger << plane
#   end

#   def controler(plane)
#     if !@plane.include? plane
#       'The plane has taken off'
#     else
#       raise "The Weather was to bad"
#     end
#   end
# end
  # def confirm_take_off(plane)
  #   if !@hanger.include? plane
  #     'Plane has left the airport'
  #   else
  #     raise 'Plane has not taken off.'
  #   end
  # end




# class Airport

#   attr_reader :plane

#   def land_plane(plane)
#     plane
#   end

#   def take_off(plane)
#     plane
#   end

# end





  # def controler_confirm
  #   if !@hanger.include? plane
  #     "Plane has taken off"
  #   else
  #     raise "Plane was not allowed to take off"
  #   end
  # end


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





