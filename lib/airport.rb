require_relative 'plane'

# As a pilot
# So that I can arrive at my specified destination
# I would like to land my plane at the appropriate airport

# As a pilot
# So that I can set off for my specified destination
# I would like to be able to take off from the appropriate airport

class Airport


  def release_plane
    Plane.new
  end

end
