require 'plane'

class Airport
  attr_accessor :plane
  alias_method :acknowledge, :plane=
  alias_method :approve_landing, :plane

  def approve_landing
    fail 'Plane already landed.' unless @plane
    @plane
  end

  def take_off
  end
end
