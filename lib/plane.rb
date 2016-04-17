require_relative 'airport'

class Plane
  attr_reader :flying, :crashed, :location

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
    crashed? ? "... ..." : location
  end

  def land(airport) # = "a field")
    return crash unless airport.class == Airport
    if airport.permission_to_land?
      @location = airport
      airport.land_plane(self)
      @flying = false
    else
      complain
    end

    # fail "You yanking my crank, I'm on the effin' tarmac" unless flying
    # if land_location.class == Airport
    #   land_location.permission_to_land? ? safe_land(land_location) : stay_in_air
    # else
    #   crash(land_location)
    # end
  end

  def complain
    "It's bloody cats and dogs out there"
  end

  def take_off(take_off_location)
    fail "I'm already up here mate" if flying
    fail "This birds got no wings" if crashed
    fail "You frickin' loopy, I'm in #{location}" unless take_off_location == location
    @location = 'the sky'
    @flying = true
    nil
  end

  private

  def crash(land_location)
    @location = land_location
    @flying = false
    @crashed = rand(2) == 1
    "Crash landing"
  end

  def safe_land(land_location)
    @location = land_location
    @flying = false
    nil
  end

  def stay_in_air
    "A couple more laps of the run-way folks"
  end

end
