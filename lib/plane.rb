class Plane

  attr_reader :status

  def initialize
    @status = :new
  end

  def land airport
    # land a plane that is in air to an available airport
    raise 'Plane not in air' unless @status == :in_air
    @status = :landed if airport.accept_plane self
    self
  end

  def take_off airport
    # instruct a plane to take off from the airport where it's landed
    raise 'Plane not landed' unless @status == :landed
    @status = :in_air if airport.release_plane self
    self
  end

  def new_to_landed airport
    # add a newly created plane to an available airport; set status to :landed
    raise 'Not a new plane' unless @status == :new
    @status = :landed if airport.add_plane self
    self
  end
end
