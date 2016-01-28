class Plane

attr_accessor :status

  def initialize
    @status = :Flying
  end

  def change_status
    @status =
      status == :Flying ? :Landed : :Flying
  end

  def landed?
    status == :Landed
  end

  def flying?
    status == :Flying
  end

end
