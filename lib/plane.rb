require_relative 'airport'

class Plane


  def initialize
    @flying = true
   # @land_authorised = false
  end

  # attr_reader :flying
  # find out if attr_reader would work or not.
  # looks bad because want a ? method and ?
  # doesn't seem to work with attr_reader.

  def flying?
    @flying
  end

  def landed?
    !@flying
  end
  

  def land
    #if @land_authorised
      @flying = false
    #end
  end
  # NEED TO MAKE THIS CONDITIONAL ON THE AIRPORT
  # METHOD RECEIVE_PLANE BEING CALLED
  # if airport.receive_plane(plane) DOESNT WORK.

  def takeoff
    @flying = true
  end
  # NEED TO MAKE THIS CONDITIONAL ON THE AIRPORT
  # METHOD RELEASE_PLANE BEING CALLED
  # if airport.release_plane(plane) DOESNT WORK.

  # def land_athorised?
  #   @land_authorised
  # end

  # def land_authorised
  #   @land_authorised = true
  # end

  # def land_authorised_over
  #   @land_authorised = false
  # end


end
