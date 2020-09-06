class Plane

  attr_reader :status

  # TODO: Change status to 'landed' later. Set to airborne for now for the sake of testing 'land' method
  def initialize
    @status = :airborne
  end

  def land
    raise 'Plane is already on the ground' if @status == :landed

    @status = :landed
    true
  end
end