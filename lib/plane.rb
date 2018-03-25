class Plane

  attr_accessor :status

  def initialize
    @status = ''
  end

  def land airport
    @status = :landed if airport.accept_plane self
  end

  def take_off
  end
end
