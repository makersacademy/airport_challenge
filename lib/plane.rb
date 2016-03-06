class Plane

  private

  @flying
  @current_airport

  def dock_at(airport)
    @current_airport = airport
  end

  public

  def initialize(airport=nil)
    if airport == nil
      @flying = true
    else
      @flying = false
      dock_at airport
    end
  end

  def land(airport)
    @flying = false
    dock_at airport
  end

  def takeoff
    @flying = true
  end

  def airborne?
    @flying
  end

  def stationed_at?
    @current_airport
  end

end
