require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 40

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'Airport full' if full?
    planes << plane
  end

  def full?
    planes.count >= @capacity
  end

#########################################



  #
  # def take_off_plane(plane)
  #   plane
  # end

  # def take_off_confirm(num_of_planes)
  #   if take_off(plane)
  #     'plane has left airport'
  #   end
  # end
########################################


end
