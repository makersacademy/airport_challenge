class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    fail 'Airport is full' if @plane
    @plane = plane
  end

  def hangar
    @hangar
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end

#   def full?
#     fail 'Airport is full - plane cannot land' if @hangar.length >= 1
#   end
#
#   def prevent_landing?
#     fail 'Bad weather, plane cannot land' if true
#   end
#
#   def prevent_take_off?
#     fail 'Bad weather, plane cannot take off' if true
#   end
# end
