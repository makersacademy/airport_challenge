class Plane

  attr_accessor :status

  def initialize
    @status = :landed
  end

  def land airport
    @status = :landed if airport.accept_plane self
  end

  def take_off airport
    @status = :in_air if airport.release_plane self
  end
end
