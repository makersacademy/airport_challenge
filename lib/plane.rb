

class Plane

  def initialize
    @flying = false
  end

  def landing?
    @flying && airport.traffic_control == true
  end

  def landed?
    !@flying
  end

  def departing?
    if @stormy == false && pilot.depart? == true
  end

  def reported_flying
    @flying = true
  end


  def flying?
    @flying
  end
