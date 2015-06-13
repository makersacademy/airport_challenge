require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  # attr_reader :flying
  # find out if attr_reader would work or not.
  # looks bad because want ? method and 
  # doesn't seem to work with attr_reader name.

  def flying?
    @flying
  end

  def landed?
    @flying = false
  end

  # NEED TO ADD SOME WAY FOR PLANE TO KNOW
  # IF IT HAS LANDED
  # HOW TO CONNECT THE LAND METHOD
  # IN THE AIRPORT WITH THE FLYING? STATUS
  # OF THE PLANE

  def land
    !@flying
  end
end
