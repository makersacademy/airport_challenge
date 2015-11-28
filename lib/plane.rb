class Plane

  attr_reader :status

  def report_landed
    @status = :on_the_ground
  end

  def report_taken_off
    @status = :in_the_air
  end

end
