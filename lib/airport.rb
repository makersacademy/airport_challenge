require_relative 'plane'

class Airport

  attr_reader :full
  attr_reader :weather

  def initialize(planes_parked)
    @planes = []
    @planes_parked = planes_parked
    @full = @planes_parked > 100
    @weather = Weather.new
  end

  def park_plane
    @new_plane = Plane.new
    @planes_parked += 1
    @planes << @new_plane
  end


# # TO DO: make it work and refactor
#   def clear_plane_to_land(plane_id)
#     if @full
#       p "Sorry, no room to land"
#     else
#       @planes.each do |plane|
#         if plane[plane_id] == plane_id
#           plane_to_land = plane
#         end
#         if plane_to_land
#             p "#{plane_id} clear to land"
#             plane_to_land.land
#         else
#           p "New plane arriving"
#           new_plane = Plane.new(plane_id)
#           p "#{plane_id} clear to land"
#           new_plane.land
#         end
#       end
#     end
#     @planes_parked += 1
#   end

# I would like a default airport capacity that can be overridden as appropriate

end

airport = Airport.new(100)
