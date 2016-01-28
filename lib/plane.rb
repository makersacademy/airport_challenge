class Plane

attr_reader :status

  def initialize(status =:Flying)
    @status = status
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
