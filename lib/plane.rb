require_relative 'airport'
class Plane
  attr_accessor :plane, :status
  def initialize
    @plane
    @status = 'Flying'
  end

  def report_status
    @status
  end

  def land(destination)
    @status = "Landed"
    destination.accept_plane(self)
  end

  def take_off(airport)
    @status = "Flying"
    airport.release_plane(self)
  end
end