class Airport
attr_reader :stormy_weather

def initialize(capacity, stormy_weather)
  @capacity = capacity
  @stormy_weather = stormy_weather
  @plane = []
end


  # def instruct_plane_land(new_plane)
  #
  #   if @capacity <=20
  #     true
  #   elsif @stormy_weather == true
  #       false
  #   else
  #
  #   end
  # end




  def land(new_plane)
      @plane.each do |plane| plane.new_plane
         if stormy_weather? == true
           return false
         end

      end


  end






def take_off(plane)

   if @stormy_weather == true
     false
   else
     true
   end
end




 def confirm_no_plane(plane)

   if @capacity == 0
     true
   elsif @capacity <= 20
     false
   end
 end
end



 # if @capacity <= 20
 #   false
 # elsif capacity.empty?
 #   true


#
#  # def prevent_landing_full?
#  #if @capacity > 0
#
#  #  true
#  # end
#
# end
#
#class Plane
#
# def land
#   0
# end
