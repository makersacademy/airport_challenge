require "plane.rb"

class Airport

  attr_reader :hanger

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capcaity = capacity
    @hanger = []
    # @weather = weather
  end

  # def weather 
  #   weather = rand[1..9]
  # end

  def land_plane(plane)
    fail "Cannot land, Hanger full" if full?
    @hanger << plane
  end

  def take_off(plane)
    fail "Cannot take off, No plane available" if empty?
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

  private

  def full?
    @hanger.count >= DEFAULT_CAPACITY
  end

  def empty?
    @hanger.empty?
  end


end



# require "plane.rb"

# class Airport

#   attr_reader :hanger

#   DEFAULT_CAPACITY = 20

#   def initialize(capacity=(DEFAULT_CAPACITY))
#     @capcaity = capacity
#     @hanger = []
#     @weather = weather
#   end

#   def weather 
#     weather_check = rand(1..9)
#     if weather_check <= 6
#       @weather = true
#     else
#       @weather = false
#     end
#   end

#   def land_plane(plane)
#     fail "Cannot land, Airport full" if full?
#     if @weather == true
#       @hanger << plane
#     else
#       puts 'Weather is to bad'
#     end
#   end

#   def take_off(plane)
#     fail "Cannot take off, No Airport" if full? == false
#     if @weather == true 
#       @hanger.delete(plane)
#     else 
#       puts "Weather is to bad"
#     end
#   end

#   def hanger_check 
#     @hanger
#   end

#   def air_traffic_controller(plane)
#     if !@hanger.include? plane
#       "The plane has taken off"
#     else 
#       raise "The Plane is grounded"
#     end
#   end

#   def full?
#     @hanger.count >= DEFAULT_CAPACITY
#   end

# end








# # require_relative "plane"

# # class Airport

# #   attr_reader :hanger

# #   def initiailze
# #     @hanger = []
# #   end

# #   def hanger_check
# #     @hanger
# #   end

# #   def land_plane(plane)
# #     @hanger << plane
# #   end

# #   def controler(plane)
# #     if !@plane.include? plane
# #       'The plane has taken off'
# #     else
# #       raise "The Weather was to bad"
# #     end
# #   end
# # end
#   # def confirm_take_off(plane)
#   #   if !@hanger.include? plane
#   #     'Plane has left the airport'
#   #   else
#   #     raise 'Plane has not taken off.'
#   #   end
#   # end




# # class Airport

# #   attr_reader :plane

# #   def land_plane(plane)
# #     plane
# #   end

# #   def take_off(plane)
# #     plane
# #   end

# # end





#   # def controler_confirm
#   #   if !@hanger.include? plane
#   #     "Plane has taken off"
#   #   else
#   #     raise "Plane was not allowed to take off"
#   #   end
#   # end


# # class Airport
# #   # attr_reader :plane

# #   def initiailze(hanger,plane)
# #     @hanger = []
# #   end

# #   def land_plane(plane)
# #     @hanger << plane
# #   end

# #   def take_off(plane)
# #     plane
# #   end


# # end







