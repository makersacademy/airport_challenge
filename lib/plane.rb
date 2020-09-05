require_relative "airport"

class Plane
  def initialize
    @current_airport = nil
  end

  def land(airport)
    fail "This plane is already landed" if landed?
    @current_airport = airport
  end

  def take_off
  end

  private

  def landed?
    @current_airport != nil
  end
end

=begin

class Plane
  attr_reader :plane_status

  def initialize
    @plane_status = "landed"
  end

  def land(airport)
    @plane_status = "landed"

    land(landing_plane)
  end

  def take_off(plane)
    @flying = "in the air"
  end
end

=end
