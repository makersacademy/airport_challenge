require_relative 'airport'

class Plane
  attr_reader :location


  def initialize
    @flying = true
    @crashed = false
    @location = 'the sky'
  end

  def flying?
    flying
  end

  def crashed?
    crashed
  end

  def broadcast_location
    crashed? ? static : location
  end

  def land(airport = "a field")
    return insult unless flying?
    return crash(airport) unless airport.class == Airport
    airport.permission_to_land?(self) ? safe_land(airport) : complain
  end

  def take_off(airport)
    return static if crashed?
    return insult if flying? || !present?(airport)
    airport.permission_to_leave?(self) ? leave(airport) : complain
  end



  def complain
    "Permission denied: turn that bird around"
  end

  def insult
    "You been on the wacky-backy, You're in #{location}"
  end

  def static
    "... ..."
  end

  def cheer
    "Another great manouveur from Air Master Ward"
  end



  private
  attr_reader :flying, :crashed

  def safe_land(airport)
    @location = airport
    airport.land_plane(self)
    @flying = false
    cheer
  end

  def leave(airport)
    @flying = true
    airport.plane_take_off(self)
    @location = 'the sky'
    cheer
  end

  def crash(land_location)
    @location = land_location
    @flying = false
    @crashed = true
    "Crash landing"
  end

  def stay_in_air
    "A couple more laps of the run-way folks"
  end

  def present?(airport)
    airport == location
  end

end
