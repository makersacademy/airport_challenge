class Plane
  attr_reader :landing_status

  def initialize
    @landing_status = nil
  end

  def land(airport)
    land_exceptions(airport)
    airport.store_plane(self)
    @landing_status = true
  end

  def take_off(airport)
    take_off_exceptions(airport)
    airport.release_plane(self)
    @landing_status = false
  end

  def confirm_landed?
    landing_status
  end

  def confirm_take_off?
    !landing_status
  end

  private

  def weather
    Weather.new.check_weather
  end

  def land_exceptions(airport)
    fail "Plane is already landed at #{airport}." if airport.planes.include? (self)
    fail "The weather is currently stormy and it is not safe to land." if weather == "stormy"
  end

  def take_off_exceptions(airport)
    fail "Plane is not currently in #{airport} so cannot take off." unless airport.planes.include? (self)
    fail "The weather is currently stormy and it is not safe to depart." if weather == "stormy"
  end

end
