class Plane

  attr_reader :status, :airport_at

  def land(airport)
    @status = :on_the_ground
    @airport_at = airport
  end

  def report_taken_off
    @status = :in_the_air
  end



end
