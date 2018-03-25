class Plane

  attr_accessor :status

  def initialize
    @status = :landed
  end

  def land airport
    raise 'Plane already landed' if landed?
    @status = :landed if airport.accept_plane self
  end

  def take_off airport
    raise 'Plane already in air' unless landed?
    @status = :in_air if airport.release_plane self
  end
  
  private
  def landed?
    @status == :landed
  end
end
