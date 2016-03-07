class Plane

  private

  def dock_at airport
    @current_airport = airport
  end

  def depart_from_airport
    @current_airport = nil
  end

  def current_status_is desired_status
    true if @current_status == desired_status
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
    raise 'Warning! Already landed.' unless current_status_is :flying
    @current_status = :landed
    dock_at airport
  end

  def takeoff
    raise 'Warning! Already in flight.' unless current_status_is :landed
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
