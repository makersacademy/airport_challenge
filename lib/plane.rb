class Plane

  private

  def dock_at airport
    @current_airport = airport
  end

  def depart_from_airport
    @current_airport = nil
  end

  def check_current_status desired_status
    return if @current_status == desired_status
    raise 'Warning! Already in flight.' if desired_status == :landed
    raise 'Warning! Already landed.' if desired_status == :flying
    fail "Required Status Unknown."
  end

  public

  def initialize airport = nil
    if airport == nil
      @current_status = :landed
      takeoff
    else
      @current_status = :flying
      airport.land_airplane self
    end
  end

  def land airport
    check_current_status :flying
    @current_status = :landed
    dock_at airport
  end

  def takeoff
    check_current_status :landed
    depart_from_airport
    @current_status = :flying
  end

  def airborne?
    @current_status == :flying
  end

  def stationed_at?
    @current_airport
  end

end
